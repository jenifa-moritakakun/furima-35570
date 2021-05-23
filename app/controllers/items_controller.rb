class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
    # @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # @item = Item.find(params[:id])
  end

  private

  def create_params
    params.require(:item).permit(:image, :name, :description, :details_category_id, :details_status_id, :shipping_charges_id,
                                 :shipping_area_id, :shipping_days_id, :selling_price).merge(user_id: current_user.id)
  end
end
