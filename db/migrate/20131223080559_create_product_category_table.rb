class CreateProductCategoryTable < ActiveRecord::Migration
  def change
    create_table :categories_products do |t|
    	t.belongs_to :product
    	t.belongs_to :category
    end
  end
end
