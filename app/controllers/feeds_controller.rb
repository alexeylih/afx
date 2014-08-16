require "rubygems"
require "open-uri"
require 'uri'
require 'rss_parser'

class FeedsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
  	render json: current_user.feeds.all
  end

  def show 
    begin
      feed_id = params[:id]
      feed = Feed.find(feed_id)

      current_user.feeds << feed unless current_user.feeds.find(feed_id)

      articles = get_articles(feed.url)
      ReadingArticle.add_reading_articles(feed_id, current_user.id, articles, logger)
      render json: current_user.reading_articles.where(feed_id: feed_id).order(created_at: :desc)

    rescue => e
      logger.debug e.to_s
      render :json => { :errors => e.to_s }, :status => 500  
    end
  end 

  def create
    begin

      render :json => { :errors => "Already exists" }, :status => 500  if current_user.feeds.find_by_url(params[:url])

      feed = Feed.new(url: params[:url], title: "title") 
      if feed.save
        current_user.feeds << feed
        render json: feed
      else        
        render :json => { :errors => feed.errors.first.to_s }, :status => 433  
      end
    rescue => e
      logger.debug e.to_s
      render :json => { :errors => e.to_s }, :status => 500  
    end
  end

  private 
  
  def get_articles(url)
    xml_data = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) 
    rss_parser = RssParser.new(logger)
    articles = rss_parser.parse(xml_data)
  end


  def feed_params
      #params.require('feed').permit(:title)
    end

  end



