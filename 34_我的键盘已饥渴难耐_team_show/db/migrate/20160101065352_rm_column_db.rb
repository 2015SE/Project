class RmColumnDb < ActiveRecord::Migration
  def change
  	remove_column :notices, :notice_id
  	remove_column :projects, :project_id
  	remove_column :admins, :admin_id
  	remove_column :articles, :article_id
  	remove_column :articles, :release_date
  	remove_column :notices, :release_date
  end
end
