class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  helper_method :is_cinema_owner?

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

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

  def require_cinema_owner
    if not is_cinema_owner?
      redirect_to root_path, notice: '你没有权限这样操作！如有疑问，请联系管理员！'
    end
  end

  def is_cinema_owner?
    !current_member.blank? and current_member.role.seller? and current_member.business_scope.include?(:cinema)
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
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :nickname, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nickname, :email, :password, :password_confirmation, :current_password) }
  end

end
