require "rubygems"
require "open-uri"
require 'rss_parser'


class FeedsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
  	@feeds = User.find(9).feeds.all
  	render json: @feeds
  end

  def show 
    user_id = 10
    current_user = User.find(user_id)

    feed = Feed.find(params[:id])
    
    unless current_user.feeds.find(params[:id])
      current_user.feeds << feed
    end

    logger.debug "Opening url #{feed.url}"
    xml_data = open(feed.url) 

		rss_parser = RssParser.new(logger)
		articles = rss_parser.parse(xml_data)

    ReadingArticle.add_reading_articles(params[:id], user_id, articles)
  	render json: User.find(user_id).feeds.find(params[:id]).reading_articles

  end 


  def create
    current_user = User.find(9)

    # refactor here, convert to one liners
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

  def top
    
  end 

  private 
  
  def feed_params
      #params.require('feed').permit(:title)
  end

end



