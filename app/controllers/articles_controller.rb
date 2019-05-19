class ArticlesController < ApplicationController
  before_action :redirect_to_index, except: [:index, :show]
  def index
    @articles = Article.all.order("id DESC").page(params[:page]).per(3)
  end
  def new
    @article = Article.new
  end
  def create
    Article.create(create_params)
  end
  def show
    @article = Article.find(params[:id])
  end
  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
    end
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(create_params)
    end
  end
  def create_params
     params.require(:article).permit(:title, :image, :text).merge(user_id: current_user.id)
  end
  def redirect_to_index
    redirect_to action: :index unless user_signed_in?
  end
end