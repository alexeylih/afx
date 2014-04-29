class ReadingArticlesController < ApplicationController
  before_action :set_reading_article, include_only: [:read, :like]

  def read
  	@reading_article.read = true 
  	@reading_article.save!
    head :ok
  end

  def like
  	@reading_article.like = true 
  	@reading_article.save!
  	head :ok
  end


  def reset_all
  	ReadingArticle.all.each do |a|
  		a.like = false
  		a.read = false
  		a.save
  	end
  	head :ok
  end 

  private 

  def set_reading_article 
    @reading_article = ReadingArticle.find(params[:id])
  end

end
