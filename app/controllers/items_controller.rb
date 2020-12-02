class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: :show

  def edit
  end

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
     @item = Item.new
  end
  
  def create
     @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
  end

  private

  def items_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
