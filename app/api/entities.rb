module APIEntities
  class Node < Grape::Entity
    expose :id, :name
  end

  class Product < Grape::Entity
    expose :id, :name
  end

  class Member < Grape::Entity
    expose :id, :email, :mobile
  end
end