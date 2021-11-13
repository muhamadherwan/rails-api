class ArticlesController < ApplicationController
  include Paginable

  def index
    #pagination
    paginated = paginate(Article.recent)
    # return data with serialzation + pagination + pagination metadata
    render_collection(paginated)
  end

  def show
    article = Article.find(params[:id])
    render json: serializer.new(article), status: :ok
  end

  def serializer
    ArticleSerializer
  end

end
