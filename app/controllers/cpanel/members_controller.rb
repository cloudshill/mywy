class Cpanel::MembersController < Cpanel::ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]
	def index
		@members = Member.all
	end

  def edit
    
  end

  def update
    params[:member][:business_scope] ||= []
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to cpanel_members_path, notice: '会员信息更新成功.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @member.destroy
      redirect_to cpanel_members_path, notice: '会员已经成功删除.'
    end
  end

  private
  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit({:business_scope => []}, :role)
  end
end
