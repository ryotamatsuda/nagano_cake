class Admins::OrdersController < ApplicationController
  def index
    @all_orders = Order.all
  end
  #order_itemsコントローラーのindexアクションでもある
  def show
    @order = Order.find(params[:id])
  end
  def update
    order = Order.find(params[:id])
    # 入金待ちから変更するなら(現在入金待ち)
    if order.order_status == '入金待ち'
      order.order_items.each do |o_i|
        o_i.update(production_status: '制作待ち')
      end
    end
    # 入金待ちに変更するなら(現在入金待ち以外)
    if order_params[:order_status] == '入金待ち'
      order.order_items.each do |o_i|
        o_i.update(production_status: '着手不可')
      end
    end
    order.update(order_params)
    redirect_to admins_orders_path
  end
  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
