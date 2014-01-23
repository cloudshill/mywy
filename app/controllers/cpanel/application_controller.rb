# encoding: utf-8
class Cpanel::ApplicationController < ApplicationController
  layout "cpanel"
  
  before_filter :require_admin
  
  def require_admin
    if current_admin.blank?
      respond_to do |format|
        format.html  {
          authenticate_admin!
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end
  
end