class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item_id, only: [:index, :create]

  def index
    @order_residence = OrderResidence.new
  end

  def create
    @order_residence = OrderResidence.new(order_params)
    if @order_residence.valid?
      pay_item
      @order_residence.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_residence).permit(:post_num, :place_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

end

