class SubscriptionsUsers < ActiveRecord::Migration
  def change
  	create_table :subscriptions_users, :id => false do |t|
		t.integer :subscription_id
		t.integer :user_id
		
	end
  end
end
