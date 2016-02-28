class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupname
      t.integer :user_id
      t.integer :disksize

      t.timestamps null: false
    end
  end
end
