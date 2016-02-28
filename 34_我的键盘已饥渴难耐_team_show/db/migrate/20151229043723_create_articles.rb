class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :article_id
      t.string :title
      t.text :content
      t.string :admin_id
      t.string :release_date

      t.timestamps null: false
    end
  end
end
