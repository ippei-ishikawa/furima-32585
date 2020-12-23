class ItemsController < ApplicationController
  def index
  end  

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect to root_path
    else
      render :new
    end  
  end
  
  private 
  def item_params
   params.require(:item).permit(:item, :price, :image, :detail, :category_id, :condition_id, :shipping_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end
end
