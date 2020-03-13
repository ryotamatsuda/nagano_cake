class Publics::OrdersController < ApplicationController

  before_action :authenticate_end_user!

  def new
  end

  def purchase_confirmation
    @order_method_of_payment = params[:order][:method_of_payment]
    @order_delivery_info_kind = params[:order][:delivery_info_kind]
    case @order_delivery_info_kind
    when 'other'
      @other_address = Address.find(params[:other][:address_id])
    when 'new'
      @new_post_code = params[:new][:post_code]
      @new_street_address = params[:new][:street_address]
      @new_name = params[:new][:name]
    end
    @new_order = Order.new
  end

  def create
    new_order = Order.new(order_params)
    new_order.end_user_id = current_end_user.id
    new_order.total_price = current_end_user.cart_items_total_price
    puts new_order
    new_order.save
    current_end_user.cart_items.each do |c_i|
      OrderItem.create(order_id: new_order.id, item_id: c_i.item_id, count: c_i.count, subtotal_price: c_i.subtotal_price)
      c_i.destroy
    end
    redirect_to orders_purchase_completed_path
  end

  def purchase_completed
  end

  def index
    @all_orders = Order.all.includes(:order_items)
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :shopping_post_code, :shopping_street_address, :shopping_name)
  end
end
