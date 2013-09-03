#this object contains only article details

class Article < ActiveRecord::Base
	has_many :reading_articles
	has_many :users, through: :reading_articles
	has_many :feeds, through: :reading_articles
end
