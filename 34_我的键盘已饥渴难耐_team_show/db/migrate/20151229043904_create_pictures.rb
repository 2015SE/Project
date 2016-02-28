class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture_id
      t.string :article_id
      t.string :picture_path

      t.timestamps null: false
    end
  end
end
