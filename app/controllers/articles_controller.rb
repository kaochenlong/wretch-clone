class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :set_user_article, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.order(id: :desc)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to articles_path, notice: "文章新增成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: '刪除成功'
  end

  private
  # Strong Paramenter
  def article_params
    params.require(:article)
          .permit(:title, :content, :sub_title)

    # .merge(a: 1, b: 2)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_user_article
    @article = current_user.articles.find(params[:id])
  end
end
