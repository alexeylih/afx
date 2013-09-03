class DropAssoc < ActiveRecord::Migration
  def change
  	drop_table :users_subscriptions
  end
end
