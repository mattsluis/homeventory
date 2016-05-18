class ItemsController < ApplicationController
  def index
    puts @current_user.id
  	@items = Item.where({user_id: @current_user.id})
  end
  
  def show
    @item = Item.find params[:id]
  end

  def new
  	@item = Item.new
  end

  # Sets is_favorite of the item to true, thus adding it to the favorites list
  def update
    Item.find(params[:id]).update(is_favorite: true)
    redirect_to factual_path
  end

  def reset_count
    @item = Item.find(params[:id]).update(count: 0)
    redirect_to item_path(params[:id])
  end

  def destroy
    deleted_item = Item.find(params[:id]).delete
    flash[:danger] = "The #{deleted_item.name} item has been deleted."
    redirect_to items_path
  end

end
