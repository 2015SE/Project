class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
      t.integer :group_id
      t.integer :user_id
      t.integer :file_id
      t.string :right_w
      t.string :right_r
      t.string :right_wr

      t.timestamps null: false
    end
  end
end
