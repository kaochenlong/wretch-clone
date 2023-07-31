class OrdersController < ApplicationController
  include Solutionable

  before_action :authenticate_user!

  def pay
    @order = Order.find_by!(num: params[:id])
  end

  def create
    price = solution_price(orders_params[:solution])
    redirect_to root_path, alert: '無此方案' and return if price.nil?

    @order = current_user.orders.new(orders_params)
    @order.amount = price

    if @order.save
      # /orders/:id/pay
      redirect_to pay_order_path(@order.num), notice: '訂單已建立'
    else
      #
    end
  end

  private

  def orders_params
    params.require(:order).permit(:name, :tel, :solution)
  end
end
