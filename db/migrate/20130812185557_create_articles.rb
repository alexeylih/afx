class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :url
      t.datetime :created_at

      t.timestamps
    end
  end
end
