class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_user, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.buying_history.present? 
      redirect_to root_path
    end
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
  
  private
  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :shipping_price_id, :sender_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
