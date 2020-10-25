class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      @order_form = OrderForm.new
      render :index
    end
  end

  private
  
  def order_form_params
    params.require(:order_form).permit(:postal_code, :delivery_prefecture_id, :delivery_town, :delivery_number, :delivery_building, :phon_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end
end
