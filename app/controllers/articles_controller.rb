class ArticlesController < ApplicationController
  def index
    render json:{'data':'ayam'}
  end

  def show
    article = Article.find(params[:id])
    render json:{data:article}
  end
end
