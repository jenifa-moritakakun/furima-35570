class ItemsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def create_params
    params.require(:item).permit(:nickname, :email, :encrypted_password, :family_name, :first_name, :family_name_full_width, :first_name_full_width, :birth_day).merge(user_id: current_user.id)
  end
end
