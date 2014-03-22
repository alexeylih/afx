class Feed < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :reading_articles
	has_many :articles, through: :reading_articles
	has_many :events, as: :subject
	scope :by_users_count, :joins => :users, :group => "feeds.id"
end