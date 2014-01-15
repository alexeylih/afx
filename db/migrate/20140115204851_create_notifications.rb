class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :type
      t.string :recipient_id
      t.text :arguments

      t.timestamps
    end
  end
end
