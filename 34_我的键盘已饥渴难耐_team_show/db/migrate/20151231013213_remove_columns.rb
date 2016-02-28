class RemoveColumns < ActiveRecord::Migration
  def change
  end
  def self.up
	  remove_column :aticles, :article_id
	  remove_column :notices, :notice_id
	  remove_column :admins, :admin_id
  end

end
