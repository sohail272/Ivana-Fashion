class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.boolean :new_product
      t.boolean :has_sale
      t.boolean :giftable
      t.string :product_for, array: true, default: []
      t.string :product_color
      t.string :product_brand
      t.string :product_collection_type, array: true, default: []
      t.string :product_type, array: true, default: []
      t.string :product_offer, array: true, default: []
      t.string :product_size, array: true, default: []
      t.float :discount
      t.integer :rating
      t.string :product_occasion, array: true, default: []
      t.text :feedback

      t.timestamps
    end
  end
end
