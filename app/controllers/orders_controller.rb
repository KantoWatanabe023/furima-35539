class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item_id, only: [:index, :create]

  def index
    @order_residence = OrderResidence.new
  end

  def create
    @order_residence = OrderResidence.new(order_params)
    if @order_residence.valid?
      @order_residence.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_residence).permit(:post_num, :place_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

end

