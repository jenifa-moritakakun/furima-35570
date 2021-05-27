class OrdersController < ApplicationController
  before_action :set_item, only: [:create, :index]
  def index
    @order_address = OrderAddress.new
  end

  def create
  end

  private
  def create_params
    params.require(:item).permit(:image, :name, :description, :details_category_id, :details_status_id, :shipping_charges_id,
                                 :shipping_area_id, :shipping_days_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
