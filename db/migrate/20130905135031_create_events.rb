class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :r
      t.text :verb
      t.integer :subject_id
      t.text :subject_type

      t.timestamps
    end
  end
end
