class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
