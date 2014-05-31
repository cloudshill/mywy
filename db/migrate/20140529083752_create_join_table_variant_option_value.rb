class CreateJoinTableVariantOptionValue < ActiveRecord::Migration
  def change
    create_join_table :variants, :option_values, :id => false do |t|
      t.index [:variant_id, :option_value_id]
      t.index [:option_value_id, :variant_id]
    end
  end
end
