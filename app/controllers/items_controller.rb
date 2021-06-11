class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :search]
  before_action :move_to_root, only: [:edit, :update, :destroy]
  before_action :search_item, only: [:about, :research]

  def index
    @item = Item.all.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def about
    @items = Item.all
  end

  def research
    @results = @p.result
  end

  private

  def item_params
    params.require(:item).permit(:items_name,:items_about,:category_id,:status_id,:shipping_id,:place_id,:day_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root
    unless (current_user.id == @item.user_id) && (@item.order == nil)
      redirect_to root_path
    end
  end

  def search_item
    @p = Item.ransack(params[:q])  
  end

end
