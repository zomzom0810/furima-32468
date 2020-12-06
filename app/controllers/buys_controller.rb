class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    @buy_street = BuyStreet.new
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.buy != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_street = BuyStreet.new(buy_params)
    if @buy_street.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'                 
      )
      @buy_street.save
      redirect_to root_path
    else
      render :index
    end 
  end


  private
  def buy_params
    params.require(:buy_street).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
end
