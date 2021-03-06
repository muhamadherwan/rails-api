class ArticlesController < ApplicationController
  include Paginable
  skip_before_action :authorize!, only: [:index, :show]

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

  def create
    #article = Article.new(article_params)
    article = current_user.articles.build(article_params)
    article.save!
    render json: article, status: created
  # if fails
  rescue
    render json: article, adapter: :json_api,
      serializer: ErrorSerializer,
      status: :unprocessable_entity
  end

  def update
    #article = Article.find(params[:id])
    article = current_user.articles.find(params[:id])
    article.update!(article_params)
    render json: article, status: ok
  # if fails
  rescue
    render json: article, adapter: :json_api,
      serializer: ErrorSerializer,
      status: :unprocessable_entity
  end

  def serializer
    ArticleSerializer
  end

  private

  def article_params
    params.require(:data).require(:attributes).
      permit(:title, :content, :slug) ||
      ActionController::Parameters.new
  end

end
