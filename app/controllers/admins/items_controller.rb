class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @all_items = Item.all.includes(:genre)
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_items_path
    else
      render :new
    end
  end
  private
  def item_params
    params.require(:item).permit(:name, :genre_id, :price, :sale_status)
  end
end
