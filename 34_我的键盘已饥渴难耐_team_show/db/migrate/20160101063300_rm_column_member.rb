class RmColumnMember < ActiveRecord::Migration
  def change
  	remove_column :members, :member_id
  end
end
