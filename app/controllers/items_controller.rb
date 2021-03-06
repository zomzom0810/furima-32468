class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
 
  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
     @item = Item.new
  end
  
  def create
     @item = Item.new(items_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render new_item_path
    end
  end

  def show
  end

  def edit
    if @item.user_id != current_user.id || @item.buy != nil #アクセス制限ログインユーザー意外の人がurlから直接アクセス
      redirect_to root_path
    end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


  def destroy
    if @item.user_id != current_user.id 
      redirect_to root_path
    end

    @item.destroy
    redirect_to root_path
  end
  
  private

  def items_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  

end
