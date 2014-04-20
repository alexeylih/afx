class ReadingArticlesController < ApplicationController

  def read
  	@reading_article = ReadingArticle.find(params[:id])
  	@reading_article.read = true 
  	@reading_article.save!

  	render text: 'Read'
  end

  def like
  	@reading_article = ReadingArticle.find(params[:id])
  	@reading_article.like = true 
  	@reading_article.save!
  	render text: 'Liked'
  end


  def reset_all
  	ReadingArticle.all.each do |a|
  		a.like = false
  		a.read = false
  		a.save
  	end
  	render text: 'Success'
  end 



end
