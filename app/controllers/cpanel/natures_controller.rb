class Cpanel::NaturesController < Cpanel::ApplicationController
  before_action :set_node
  before_action :set_nature, only: [:show, :edit, :update, :destroy]

  def index
    if params[:id].to_i == 0
      @natures = @node.natures.where("parent_id = 0").order("id asc")
    else
      @natures = @node.natures.where(:parent_id => params[:id]).order("id asc")
    end
  end

  def show
  end

  def new
    @nature = Nature.new
  end

  def edit
  end

  def create
    @nature = @node.natures.build(nature_params)

    respond_to do |format|
      if @nature.save
        format.json { @nature }
      else
        format.json
      end
    end
  end

  def update
    respond_to do |format|
      if @nature.update(nature_params)
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @nature.destroy
  end

  private
    def set_node
      @node = Node.find(params[:node_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_nature
      @nature = Nature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nature_params
      params[:nature] = params[:tn]
      params.require(:nature).permit(:name, :sort, :node_id, :parent_id)
    end
end
