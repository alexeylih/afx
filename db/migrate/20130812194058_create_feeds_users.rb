class CreateFeedsUsers < ActiveRecord::Migration
  def change
    create_table :feeds_users, :id => false  do |t|
		t.references :feed, :user
    end
  end
end
