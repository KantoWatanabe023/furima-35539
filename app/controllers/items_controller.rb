class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.all.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.create(item_params)
    if @item.save
      # 保存された時はルートパスに戻るよう記述
      redirect_to root_path
    else
      # 保存されなかった時は新規投稿ページへ戻るよう記述
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:items_name,:items_about,:category_id,:status_id,:shipping_id,:place_id,:day_id,:price,:image).merge(user_id: current_user.id)
  end
end
