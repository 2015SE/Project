class CreateUserFiles < ActiveRecord::Migration
  def change
    create_table :user_files do |t|
      t.integer :user_id
      t.integer :file_id
      t.string :filename

      t.timestamps null: false
    end
  end
end
