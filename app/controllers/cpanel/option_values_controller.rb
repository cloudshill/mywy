class Cpanel::OptionValuesController < Cpanel::ApplicationController
  before_action :set_option_value, only: [:edit, :update, :destroy]
  before_action :set_option_type

  def index
    @option_values = OptionValue.all
  end

  def new
    @option_value = OptionValue.new
  end

  def create
    @option_value = @option_type.option_values.build option_value_params
    @option_value.save
  end

  def edit
    
  end

  def update
    if @option_value.update option_value_params
      redirect_to cpanel_option_type_option_values_path(@option_type), :notice => "操作成功！"
    else
      render :edit
    end
  end

  def destroy
    @option_value.destroy
    redirect_to cpanel_option_type_option_values_path(@option_type), :notice => "操作成功！"
  end

  private

  def set_option_value
    @option_value = OptionValue.find(params[:id])
  end

  def set_option_type
    @option_type = OptionType.find(params[:option_type_id])
  end

  def option_value_params
    params.require(:option_value).permit(:name, :presentation)
  end
end