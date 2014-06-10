module APIEntities
  class Node < Grape::Entity
    expose :id, :name
  end
end