class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_item, except: [:index, :new, :create]

  def find_item
    @item =  @item = Item.find(params[:id])
  end

  def index
    @items = Item.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :title, :text, :genre_id, :state_id, :shipping_fee_id, :prefecture_id, :delivery_date_id, :price
    ).merge(user_id: current_user.id)
  end
end
