class RemoveDetailsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :Password, :string
    remove_column :users, :string, :string
  end
end
