require "rubygems"
require "open-uri"
require 'rss_parser'


class FeedsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
  	@feeds = current_user.feeds.all
  	render json: @feeds
  end

  def show 
    feed_id = params[:id]
    feed = Feed.find(feed_id)
    user_feed = current_user.feeds.find_by_id(feed_id)
    current_user.feeds << feed unless user_feed

    xml_data = open(feed.url) 
		rss_parser = RssParser.new(logger)
		articles = rss_parser.parse(xml_data)

    ReadingArticle.add_reading_articles(feed_id, current_user.id, articles)
  	render json: current_user.reading_articles.where(feed_id: feed_id)
  end 

  def create
    current_user = User.current_user

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

  private 
  
  def feed_params
      #params.require('feed').permit(:title)
  end

end



