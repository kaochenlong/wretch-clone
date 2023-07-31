class OrdersController < ApplicationController
  include Solutionable

  before_action :authenticate_user!

  def pay
    @order = Order.find_by!(num: params[:id])
    @token = gateway.client_token.generate
  end

  def please_pay
    order = Order.find_by!(num: params[:id])

    result = gateway.transaction.sale(
      amount: order.amount,
      payment_method_nonce: params[:nonce]
    )

    if result.success?
      # .....
      # order.update(status: 'paid')
      redirect_to root_path, notice: '交易成功'
    else
      redirect_to root_path, alert: '交易發生錯誤，請稍候再試'
    end
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

  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: Rails.application.credentials.braintree.merchant_id,
      public_key: Rails.application.credentials.braintree.public_key,
      private_key: Rails.application.credentials.braintree.private_key,
    )
  end
end
