require "entities"
require "helpers"

class API < Grape::API
  prefix "api"
  format :json

  helpers APIHelpers

  resource :nodes do
    desc "Return list of nodes"
    get do
      @nodes = Node.all
      present @nodes, with: APIEntities::Node
    end
  end

  resource :products do
    get do
      @products = Product.all.order("created_at desc")
      @products = @products.send(params[:type]) if ['excellent', 'no_reply', 'popular', 'recent'].include?(params[:type])
      @products = @products.paginate(page: params[:page], per_page: params[:per_page] || 30)
      present @products, with: APIEntities::Product
    end

    get ":id" do
      @product = Product.find(params[:id])
      present @product, with: APIEntities::DetailProduct
    end

    get "node/:id" do
      @node = Node.find(params[:id])
      @products = @node.products.order("created_at desc")
      @products = @products.send(params[:type]) if ['excellent', 'no_reply', 'popular', 'recent'].include?(params[:type])
      @products = @products.paginate(page: params[:page], per_page: params[:per_page] || 30)
      present @products, with: APIEntities::Product
    end
  end

  resource :members do
    get ":id" do
      authenticate!
      @member = Member.find(params[:id])
      present @member, with: APIEntities::Member
    end

    post "sign_in" do
      @member = Member.find_for_authentication( login: params[:member][:login] )

      if @member and @member.valid_password?( params[:member][:password] )
        { :success => true, :auth_token => @member.authentication_token, :email => @member.email }
      else
        { :success => false, :auth_token => "", :email => "" }
      end
    end

    post "sign_up" do
      @member = Member.new(params[:member])
      if @member.save
        { :success => true, :auth_token => @member.authentication_token, :email => @member.email }
      else
        { :success => false, :auth_token => "", :email => "" }
      end
    end
  end

end