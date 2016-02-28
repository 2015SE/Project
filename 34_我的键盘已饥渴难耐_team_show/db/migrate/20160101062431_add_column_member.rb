class AddColumnMember < ActiveRecord::Migration
  def change
  	add_column :members, :passwd, :string
  end
end
