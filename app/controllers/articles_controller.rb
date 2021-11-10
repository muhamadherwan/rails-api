class ArticlesController < ApplicationController
  include Paginable

  def index
    #articles = Article.order('created_at DESC')
    #articles = Article.recent
    #render json:{data:articles}, status: :ok

    #pagination
    paginated = paginate(Article.recent)

    # return data with serialzation + pagination + pagination metadata
    render_collection(paginated)
  end

  def serializer
    ArticleSerializer
  end

  def show
    article = Article.find(params[:id])
    #render json:{data:article}
    render json: serializer.new(article), status: :ok
 end

end
