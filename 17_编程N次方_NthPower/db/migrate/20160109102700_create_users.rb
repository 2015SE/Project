class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :disksize
      t.integer :usesize

      t.timestamps null: false
    end
  end
end
