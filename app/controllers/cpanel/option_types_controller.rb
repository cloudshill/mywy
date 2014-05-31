class Cpanel::OptionTypesController < Cpanel::ApplicationController
  before_action :set_option_type, only: [:edit, :update, :destroy]

  def index
    @option_types = OptionType.all
  end

  def new
    @option_type = OptionType.new
  end

  def create
    @option_type = OptionType.new option_type_params
    if @option_type.save
      redirect_to cpanel_option_types_path, :notice => "操作成功！"
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @option_type.update option_type_params
      redirect_to cpanel_option_types_path, :notice => "操作成功！"
    else
      render :edit
    end
  end

  def destroy
    @option_type.destroy
    redirect_to cpanel_option_types_path, :notice => "操作成功！"
  end

  private

  def set_option_type
    @option_type = OptionType.find(params[:id])
  end

  def option_type_params
    params.require(:option_type).permit(:name, :presentation)
  end
end