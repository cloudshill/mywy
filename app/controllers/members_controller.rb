class MembersController < ApplicationController
  def check_email
    respond_to do |format|
      format.json do
        render json: !Member.where('lower(email) = ?', params[:member][:email].downcase).where.not(id: params[:id]).exists?
      end
    end
  end

  def check_nickname
    respond_to do |format|
      format.json do
        render json: !Member.where('lower(nickname) = ?',  params[:member][:nickname].downcase).where.not(id: params[:id]).exists?
      end
    end
  end
end