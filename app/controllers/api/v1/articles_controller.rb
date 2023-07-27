class Api::V1::ArticlesController < Api::V1::BaseController
  before_action :authenticate_user!

  def like
    article = Article.find(params[:id])

    status = current_user.toggle_like(article)
    render json: {liked: status}
  end
end
