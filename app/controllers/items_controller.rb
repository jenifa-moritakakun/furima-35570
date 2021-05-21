class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    @item.save
  end

  private
  def create_params
    params.require(:item).permit(:name, :description, :details_category_id, :details_status_id, :shipping_charges_id, 
                                :shipping_area_id, :shipping_days_id, :selling_price)
  end

end
