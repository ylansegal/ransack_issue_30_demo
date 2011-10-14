class OrdersController < ApplicationController
  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(:distinct => true).includes(:customer)
  end
end
