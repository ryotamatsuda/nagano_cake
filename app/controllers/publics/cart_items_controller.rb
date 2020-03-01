class Publics::CartItemsController < ApplicationController

  before_action :authenticate_end_user!

  def index
  end

  def create
    cart_item = CartItem.find_by(end_user_id: current_end_user.id, item_id: cart_item_params[:item_id])
    if cart_item
      cart_item.count += cart_item_params[:count].to_i
    else
      cart_item = current_end_user.cart_items.new(cart_item_params)
    end
    cart_item.save
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:count, :item_id)
  end
end
