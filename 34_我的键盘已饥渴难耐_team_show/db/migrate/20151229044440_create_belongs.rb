class CreateBelongs < ActiveRecord::Migration
  def change
    create_table :belongs do |t|
      t.string :member_id
      t.string :project_id

      t.timestamps null: false
    end
  end
end
