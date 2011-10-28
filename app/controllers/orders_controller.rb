class OrdersController < ApplicationController
  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result(:distinct => true)
  end
  
  def index_with_includes
    @q = Order.ransack(params[:q])
    @orders = @q.result(:distinct => true).includes(:customer)
    render :index
  end
end
