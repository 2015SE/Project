class CreateUsergroups < ActiveRecord::Migration
  def change
    create_table :usergroups do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :diaplayname

      t.timestamps null: false
    end
  end
end
