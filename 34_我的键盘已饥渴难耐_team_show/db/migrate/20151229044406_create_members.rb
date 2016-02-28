class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :member_id
      t.string :name
      t.string :passwd
      t.string :phone
      t.string :qq
      t.string :is_leader

      t.timestamps null: false
    end
  end
end
