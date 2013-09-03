class ReadingArticle < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
	belongs_to :feed

	delegate :title, to: :article
    delegate :preview, to: :article

	validates :user, :presence=>true
	validates :feed, :presence=>true
	validates :article, :presence=>true

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
		articles.each do |new_article|
			logger.debug "-------------------------------------------------------------------------------"
			logger.debug "Adding article: "
			logger.debug new_article.to_yaml

			article_data = Article.find_by_url(new_article.url) 

			logger.debug "Found existing  article: "
			logger.debug article_data.to_yaml

			unless article_data
				logger.debug "Not found"
				new_article.save!
				article_data = new_article
			end
			
			logger.debug "Article data: "
			logger.debug article_data.to_yaml
			
			find_criteria = {article_id: article_data.id,
							user_id: user_id,
							feed_id: feed_id}

			logger.debug "Searching for existing reading article: "
			logger.debug find(:first, conditions: find_criteria)

			reading_article = first(conditions: find_criteria) || create(find_criteria)
		
			

		end
		
	end 





end
