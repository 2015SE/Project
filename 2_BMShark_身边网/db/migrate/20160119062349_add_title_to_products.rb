class AddTitleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :title, :string, :limit=>40
  end
end
