class CreateGroupFiles < ActiveRecord::Migration
  def change
    create_table :group_files do |t|
      t.integer :group_id
      t.integer :file_id
      t.string :filename
      t.integer :resize

      t.timestamps null: false
    end
  end
end
