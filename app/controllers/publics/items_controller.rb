class Publics::ItemsController < ApplicationController

  before_action :authenticate_end_user!

  def index
    #"Genre.valid_flag = true" かつ "Item.sale_status = true" であるitemsテーブルのレコード。
    @all_valid_items = Item.joins(:genre).where("(genres.valid_flag = ?) AND (sale_status = ?)", true, true)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
