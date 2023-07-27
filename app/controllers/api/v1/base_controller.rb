class Api::V1::BaseController < ApplicationController
  private

  def authenticate_user!
    if not user_signed_in?
      render json: { status: 'not login' }, status: 403
      return
    end
  end
end
