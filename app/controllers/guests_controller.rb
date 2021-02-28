class GuestsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      flash[:success] = "Object successfully created"
      redirect_to @guest
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :email, :phone, :address, :postal_code, :city, :country_id)
  end
end
