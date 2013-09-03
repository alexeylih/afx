class AddUserIdToReadingArticles2 < ActiveRecord::Migration
  def change
  	  	add_column :reading_articles, :feed_id, :integer
  	  	add_column :reading_articles, :article_id, :integer
  end
end
