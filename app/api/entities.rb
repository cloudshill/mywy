module APIEntities
  class Node < Grape::Entity
    expose :id, :name
  end

  class Product < Grape::Entity
    expose :id, :name, :price
  end

  class DetailProduct < Grape::Entity
    expose :id, :name, :price
    expose(:pictures) do |model, opts|
      pictures = model.pictures
      APIEntities::Picture.represent(pictures)
    end
  end

  class Picture < Grape::Entity
    expose :id, :image, :is_cover
  end

  class Member < Grape::Entity
    expose :id, :email, :mobile
  end
end