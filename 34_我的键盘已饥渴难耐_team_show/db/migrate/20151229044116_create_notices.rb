class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :notice_id
      t.string :title
      t.text :content
      t.string :admin_id
      t.string :string
      t.string :release_date

      t.timestamps null: false
    end
  end
end
