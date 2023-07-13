class ArticlesController < ApplicationController
  def index
  end

  def new
    # 實體變數
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to "/articles", notice: "文章新增成功"
    else
      render :new
    end
  end

  # Strong Paramenter
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
