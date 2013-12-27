require 'nokogiri'

class RssParser

	def initialize(logger)

		@parsing_schemas = { 
			atom: {
				feed_item: "//rss/channel/item",
				feed_title: "//rss/channel/item"
			}
			
		}

		@logger = logger
	end

	def parse(xml_data, format=:atom)
		@logger.debug "parsing"

		articles = []
		schema = @parsing_schemas[format][:feed_item]
		doc = Nokogiri::XML(xml_data)
		doc.xpath(schema).each do |rss_item|
			article = Article.new 
			article.title = rss_item.at_xpath("title").text
			article.url = rss_item.at_xpath("link").text
			article.preview = rss_item.at_xpath("description").text
			articles.push article
		end

		articles
	end

	def parse_title(xml_data, format=:atom)
		schema = @parsing_schemas[format][:feed_title]
		doc = Nokogiri::XML(xml_data)
		doc.to_s 
	end

	private

	def parse_article(json_data, parsing_schema)
		article = Article.new
		article.title = json_data[parsing_schema[:title]]
		article.url = json_data[parsing_schema[:url]]
		article
	end 

end

