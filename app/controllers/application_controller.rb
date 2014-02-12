class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_or_guest_member

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_member
    if current_member
      if session[:guest_member_id]
        logging_in
        guest_member.destroy
        session[:guest_member_id] = nil
      end
      current_member
    else
      guest_member
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_member
    # Cache the value the first time it's gotten.
    @cached_guest_member ||= Member.find(session[:guest_member_id] ||= create_guest_member.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
     session[:guest_member_id] = nil
     guest_member
  end

  def require_member
    if current_member.blank?
      respond_to do |format|
        format.html  {
          authenticate_member!
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end
  
  def after_sign_in_path_for(resource)
    if resource_name == :member
      session[:user_return_to] ||= root_path
    else
      cpanel_root_path
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if resource_name == :member
      root_path
    else
      new_admin_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nickname, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:nickname, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nickname, :email, :password, :password_confirmation, :current_password) }
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
      # comment.user_id = current_user.id
      # comment.save!
    # end
    guest_line_items = guest_member.line_items.all
    guest_line_items.each do |line_item|
      line_item.member_id = current_member.id
      line_item.save!
    end
  end

  def create_guest_member
    u = Member.create(:nickname => "guest", :email => "guest_#{Time.now.to_i}#{rand(99)}@example.com")
    u.save!(:validate => false)
    session[:guest_member_id] = u.id
    u
  end

end
