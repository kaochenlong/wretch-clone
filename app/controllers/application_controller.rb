class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :user_signed_in?, :current_user

  private

  def authenticate_user!
    if not user_signed_in?
      redirect_to login_users_path, notice: '請先登入會員'
    end
  end

  def user_signed_in?
    session[:kitty].present?
  end

  def current_user
    if user_signed_in?
      @__user__ ||= User.find_by(id: session[:kitty])
    else
      nil
    end
  end

  def not_found
    render file: Rails.root.join('public', '404.html'),
           status: 404,
           layout: false
  end
end
