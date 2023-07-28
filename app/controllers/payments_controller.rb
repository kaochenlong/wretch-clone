class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def show
    price = solution_price(params[:id])
    redirect_to root_path, alert: '無此方案' and return if price.nil?

    @order = Order.new
  end

  private

  def solution_price(s)
    solutions = {pro: 10, premium: 50}
    solutions[s.to_sym]
  end
end
