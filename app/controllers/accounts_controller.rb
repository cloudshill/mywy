class AccountsController < Devise::RegistrationsController
	before_filter :require_member

  def favorites
    @products = current_or_guest_member.my_favorite_products
  end
	
	def update
    @member = Member.find(current_or_guest_member.id)

    @successfully_updated = if needs_password?(@member, params)
      @member.update_with_password(params[:member])
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:member].delete(:current_password)
      @member.update_without_password(member_params)
    end

    if @successfully_updated
      set_flash_message :notice, :updated
      # Sign in the member bypassing validation in case his password changed
      sign_in @member, :bypass => true
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  # check if we need password to update member data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(member, params)
    !params[:member][:password].blank?
  end

  def member_params
    params.require(:member).permit(:name, :mobile)
  end
end