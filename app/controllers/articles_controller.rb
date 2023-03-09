class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def read
    # (Ruby basics: hashes and symbols)
    # puts "joe log"
    # puts "params"
    # puts params
    # puts "params[:id]"
    # puts params[:id]
    # puts "params[:action]"
    # puts params[:action]
    # puts "end of joe log"
    @article = Article.find(params[:id])
  end
end
