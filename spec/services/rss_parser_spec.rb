checrequire_relative '../spec_helper'
require 'json'
require 'nokogiri'

describe RssParser do

let(:atom_data) {
	 xml_path = Rails.root.join("spec", "services", "atom.xml")
	 rss_data = IO.read(xml_path)
}


	before(:all) do		
	end

	it "should recieve RSS xml data and
	 rss format and return array of articles" do


		rss_parser = RssParser.new 
		articles = rss_parser.parse atom_data, :atom
		
		expected_articles = [
			Article.new(title: 'Modern Methods Of Abortion Are Not Linked With An Increased Risk Of Preterm Birth', url: 'http://www.medicalnewstoday.com/releases/262870.php')
		]

		expect(articles).to eq expected_articles

	end


	# 
	# it "should return article object" do
	# 	rss = RssParser.new
	# 	xml_data = ''
	# 	parsing_schema = { title: 'title', url: 'url' } 		
	# 	article = rss.send :parse_article, json_data, parsing_schema
	# 	expect(article.class).to eq Article 
	# end

	# it "should fill article object fields with values" do
	# 	rss = RssParser.new
	# 	xml_data = '<title>Hello</title><url>www.google.com</url>'
	# 	parsing_schema = { title: 'title', url: 'url' } 		
	# 	article = rss.send :parse_article, json_data, parsing_schema
	# 	expect(article.title).not_to be_nil
	# 	expect(article.url).not_to be_nil
	# end

	# it "should fill article with values correspondin to json data" do
	# 	rss = RssParser.new
	# 	xml_data = '<title>Hello</title><url>www.google.com</url>'
	# 	parsing_schema = { title: 'title', url: 'url' } 		
	# 	article = rss.send :parse_article, json_data, parsing_schema

	# 	expect(article.title).to eq 'Hello'
	# 	expect(article.url).to eq 'www.google.com'
	# end	

	# it "should throw ParseError on unknow JSON schema" do
	# 	rss = RssParser.new
	# 	xml_data = '<UnknownTag1>Hello</UnknownTag1><UnknownTag2>www.google.com</UnknownTag2>'
	# 	parsing_schema = { title: 'title', url: 'url' } 		
	# 	article = rss.send :parse_article, json_data, parsing_schema


	# 	expect { rss.parse_article json_data parsing_schema }.to raise_error(StandardError)		

	# end 

end
