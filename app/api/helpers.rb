module APIHelpers
  def warden
    env['warden']
  end

  def authenticated
    return true if warden.authenticated?
    params[:access_token] && @member = Member.find_by_authentication_token(params[:access_token])
  end

  def authenticate!
    error!({ "error" => "401 Unauthorized" }, 401) unless authenticated
  end

  def current_member
    warden.member || @member
  end
end