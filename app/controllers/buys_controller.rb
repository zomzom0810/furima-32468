class BuysController < ApplicationController
  def index
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
