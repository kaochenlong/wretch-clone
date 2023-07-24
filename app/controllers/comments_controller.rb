class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: [:create]

  def create
    @comment = @article.comments.new(comment_params)

    if @comment.save
      # redirect_to article_path(@article), notice: '留言成功'
    else
      render "articles/show"
    end
  end

  private
  def find_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment)
          .permit(:content)
          .merge(user: current_user)
  end
end
