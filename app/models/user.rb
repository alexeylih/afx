class User < ActiveRecord::Base
	has_and_belongs_to_many :feeds
	has_many :reading_articles
	has_many :articles, through: :reading_articles
	has_many :events
end
