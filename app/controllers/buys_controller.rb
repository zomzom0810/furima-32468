class BuysController < ApplicationController

  def index
    @buy_street = BuyStreet.new
    @item = Item.find(params[:item_id])

  end

  def create
    @item = Item.find(params[:item_id])
    @buy_street = BuyStreet.new(buy_params)
    if @buy_street.valid?
      @buy_street.save
      redirect_to root_path
    else
      render :index
    end 
  end


  private
  def buy_params
    params.require(:buy_street).permit(:postal_code, :prefecture, :municipality, :address, :building, :phone_number)
  end
end
