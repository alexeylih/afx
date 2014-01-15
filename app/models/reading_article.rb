class ReadingArticle < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
	belongs_to :feed

	delegate :title, to: :article
    delegate :preview, to: :article

	validates :user, presence: true
	validates :feed, presence: true
	validates :article, presence: true

	after_initialize :default_values


    def default_values
      # self.read = false
      # self.like = false
    end


	def as_json(options = { })
    	jsonReadingArticle = super(options)
    	jsonReadingArticle[:title] = title
    	jsonReadingArticle[:preview] = preview
    	jsonReadingArticle
	end

	def self.add_reading_articles(feed_id, user_id, articles)
		new_articles_added = 0
		new_reading_articles_added = 0

		articles.each do |new_article|
			logger.debug new_article.to_yaml

			article_data = Article.find_by_url(new_article.url) 

			unless article_data
				new_articles_added += 1
				new_article.save!
				article_data = new_article
			end
			
			find_criteria = {article_id: article_data.id,
							user_id: user_id,
							feed_id: feed_id}

			existing_reading_article = first(conditions: find_criteria)
			
			if existing_reading_article
				new_reading_articles_added += 1
			end

			reading_article = existing_reading_article || create(find_criteria)
		
		end

		logger.debug "Processed #{articles.count} entries, Added #{new_articles_added} new articles and #{new_reading_articles_added} new reading articles"
		
	end 





end
