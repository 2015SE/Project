class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :category
      t.text :description

      t.timestamps null: false
    end
  end
end
