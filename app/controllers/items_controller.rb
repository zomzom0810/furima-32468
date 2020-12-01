class ItemsController < ApplicationController
  def edit
  end

  def index
  end

  def new
  end
  
  def show
  end

  private

  def items_params
    params.require(:items).permit(:image).merge(user_id: current_user.id)
  end


end
