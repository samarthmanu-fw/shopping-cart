class OrdersController < ApplicationController

  before_action :check_login
  def index
      @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def show_by_user
    @orders = Order.where(:user_id => params[:id])
  end

  def show_summary_by_user

    @items = nil
    @items = Order.where(:user_id => params[:id]) unless params[:id] == 'all'

    @items = Order
               .joins('INNER JOIN line_items ON orders.id = line_items.order_id')
               .joins('INNER JOIN products ON products.id = line_items.product_id')
               .group('line_items.product_id')
               .select("line_items.product_id, products.name, sum(line_items.quantity) as sum_line_items")
               .order("sum_line_items DESC")



  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = session[:user_id]
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end

  private
  def order_params
    params.require(:order).permit(:card_no)
  end

end