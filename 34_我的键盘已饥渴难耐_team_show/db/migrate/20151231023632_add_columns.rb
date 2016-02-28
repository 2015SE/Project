
class AddColumns < ActiveRecord::Migration
  def change
  end
  def self.up
	  add_column :projects, :admin_name
  end
end
