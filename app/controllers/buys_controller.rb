class BuysController < ApplicationController
  def index
    @buy_street = BuyStreet.new
  end

  def create
    @buy_street = BuyStreet.new(buy_params)
    if @buy_street.valid?
      @buy_street.save
      redirect_to root_path
    else
      render item_buys_path(buy)
    end 
  end


  private
  def buy_params
    params.require(:buy_street).permit(:postal_code, :prefecture, :municipality, :address, :building, :phone_number)
  end
end
