require "rubygems"
require "open-uri"
require 'uri'
require 'rss_parser'

class FeedsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
  	@feeds = current_user.feeds.all
  	render json: @feeds
  end

  def show 
    begin
      feed_id = params[:id]
      feed = Feed.find(feed_id)

      user_feed = current_user.feeds.find_by_id(feed_id)
      current_user.feeds << feed unless user_feed
      articles = get_articles(feed.url)
      ReadingArticle.add_reading_articles(feed_id, current_user.id, articles, logger)
  	  render json: current_user.reading_articles.where(feed_id: feed_id).sort_by(&:created_at)

    rescue => e
      logger.debug e.to_s
      render :json => { :errors => e.to_s }, :status => 500  
    end
  end 

  def create
    # refactor here, convert to one liners
    begin
      url = params[:url]
      feed = current_user.feeds.create(url: url, title: get_feed_title(url)) unless current_user.feeds.find_by_url(params[:url])
      event = Event.new 
      event.user = current_user
      event.subject = feed
      event.save
      render json: feed
    rescue => e
      logger.debug e.to_s
      render :json => { :errors => e.to_s }, :status => 500  
    end
  end

  

  private 
  
  def get_feed_title(url)
    title = Feed.find_by_url(url)
    unless title
      rss_parser = RssParser.new(logger)
      xml_data = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) 
      title = rss_parser.parse_title(xml_data)
    end

    title
  end

  def get_articles(url)
      xml_data = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) 
      rss_parser = RssParser.new(logger)
      articles = rss_parser.parse(xml_data)
  end

  def valid_url?(url)
    begin
      uri = URI.parse(url)
      uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      false
    end
  end

  def feed_params
      #params.require('feed').permit(:title)
  end

end



