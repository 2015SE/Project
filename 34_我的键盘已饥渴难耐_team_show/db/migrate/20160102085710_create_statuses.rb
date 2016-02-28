class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :project_id
      t.string :status

      t.timestamps null: false
    end
  end
end
