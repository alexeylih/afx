require "rubygems"
require "open-uri"
require 'rss_parser'


class FeedsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
  	@feeds = User.find(2).feeds.all
  	render json: @feeds
  end

  def show 
  	feed = User.find(2).feeds.find(params[:id])

    if valid_url?(feed.url)
      xml_data = open(feed.url) 
    else
      xml_data = open('http://www.nasa.gov/rss/dyn/breaking_news.rss') 
    end

		rss_parser = RssParser.new 
		articles = rss_parser.parse(xml_data)
		ReadingArticle.add_reading_articles(params[:id], 2, articles)
  	render json: User.find(2).feeds.find(params[:id]).reading_articles
  end 

  def create
    current_user = User.find(2)
    feed = current_user.feeds.create(title: params[:title], url: params[:url]) unless current_user.feeds.find_by_url(params[:url])
    event = Event.new 
    event.user = current_user
    event.subject = feed
    event.save
  end

  def valid_url?(url)
    begin
      uri = URI.parse(url)
      uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      false
    end
  end

  private 
  
  def feed_params
      #params.require('feed').permit(:title)
  end

  



end



