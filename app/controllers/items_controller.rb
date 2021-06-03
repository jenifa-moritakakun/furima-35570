class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(create_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end
end

  private

def create_params
  params.require(:item).permit(:image, :name, :description, :details_category_id, :details_status_id, :shipping_charges_id,
                               :shipping_area_id, :shipping_days_id, :selling_price).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def contributor_confirmation
  redirect_to root_path unless current_user == @item.user && @item.order.blank?
end
