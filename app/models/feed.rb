class Feed < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :reading_articles
	has_many :articles, through: :reading_articles
	has_many :events, as: :subject
	scope :by_users_count, :joins => :users, :group => "feeds.id"
	validate :validate_url
	before_save :set_title

	def validate_url
		errors.add(:url, "is invalid") unless url_valid?(url)
	end

	def url_valid?(url) 
		url = URI.parse(url) rescue false
		url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
	end 

	def set_title
		begin
			rss_parser = RssParser.new(logger)
			xml_data = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) 
			self.title = rss_parser.parse_title(xml_data)
		rescue
		end
	end

	def self.recommended(user)
		user.friends.inject { |feeds, usr|
			feeds+=usr.feeds
		}
	end 

	def self.hr
		@relation.count
	end

end