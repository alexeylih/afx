class AddStuffToUser < ActiveRecord::Migration
  def change
  	add_column :users, :username, :text
  	add_column :users, :provider, :text
	add_column :users, :uid, :text
  end
end
