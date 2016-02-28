class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :telephone
      t.string :email
      t.string :address

      t.timestamps null: false
    end
  end
end
