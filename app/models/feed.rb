class Feed < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :reading_articles
	has_many :articles, through: :reading_articles
end
