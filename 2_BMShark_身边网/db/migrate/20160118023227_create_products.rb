class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :shop_id
      t.decimal :price
      t.integer :quantity
      t.text :description
      t.string :category
      t.string :image_url
      t.datetime :date_available

      t.timestamps null: false
    end
  end
  
end
