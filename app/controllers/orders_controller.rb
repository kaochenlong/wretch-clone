class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    price = solution_price(orders_params[:solution])
    redirect_to root_path, alert: '無此方案' and return if price.nil?

    @order = current_user.orders.new(orders_params)
    @order.amount = price

    if @order.save
      redirect_to root_path, notice: 'ok'
    else
      #
    end
  end

  private

  def orders_params
    params.require(:order).permit(:name, :tel, :solution)
  end

  def solution_price(s)
    solutions = {pro: 10, premium: 50}
    solutions[s.to_sym]
  end
end
