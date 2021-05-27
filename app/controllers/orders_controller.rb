class OrdersController < ApplicationController
  before_action :set_item, only: [:create, :index]
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :postal_code, :shipping_area_id, :municipality, :address,
                                 :building_name, :phone_number, :order_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
