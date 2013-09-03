class AddUserIdToReadingArticles < ActiveRecord::Migration
  def change
  	add_column :reading_articles, :user_id, :integer
  end
end
