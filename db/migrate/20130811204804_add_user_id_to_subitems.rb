class AddUserIdToSubitems < ActiveRecord::Migration
  def change
  	add_column :subitems, :user_id, :integer
  end
end
