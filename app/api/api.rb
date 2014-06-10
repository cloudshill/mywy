require "entities"
require "helpers"

class API < Grape::API
  prefix "api"
  format :json

  resource :nodes do
    desc "Return list of nodes"
    get do
      @nodes = Node.all
      present @nodes, with: APIEntities::Node
    end
  end
end