class CreateNthfiles < ActiveRecord::Migration
  def change
    create_table :nthfiles do |t|
      t.string :rename
      t.integer :filesize
      t.integer :count
      t.integer :resize

      t.timestamps null: false
    end
  end
end
