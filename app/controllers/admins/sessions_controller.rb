class Admins::SessionsController < Devise::SessionsController
  layout false
  
  def new
    super
    session["user_return_to"] = request.referrer
  end
end