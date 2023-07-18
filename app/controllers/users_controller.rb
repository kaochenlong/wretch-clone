class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: '註冊成功'
    else
      render :new
    end
  end

  def login
  end

  def logining
    user = User.login(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      # 發 session/cookie
      redirect_to root_path, notice: '登入成功'
    else
      redirect_to login_users_path, alert: '登入失敗'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
