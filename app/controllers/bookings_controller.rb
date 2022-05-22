class BookingsController < ApplicationController

  before_action :set_listing, only: [:new, :create]
  before_action :set_buyer_bookings, only: [:index]
  before_action :set_booking, only: [:destroy, :show, :edit, :update]


  def index
    @booking = Booking.where(user_profile_id: current_user.user_profile.id)
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    begin
      # Creates booking using form parameters, current user ID and listing ID 
      @booking = Booking.new(booking_params.merge(user_profile_id: current_user.user_profile.id, listing_id: params[:id]))
      @booking.save!
      redirect_to bookings_path
    rescue
      flash[:alert] = @booking.errors.full_messages.join('<br>')
      render 'new'
    end
  end

  def edit
  end

  def update
    puts @booking
    begin
      @booking.update!(booking_params)
      redirect_to booking_path
    rescue
      flash[:alert] = @booking.errors.full_messages.join('<br>')
      render 'edit'
    end
  end

  def destroy
    @booking.destroy!
    redirect_to bookings_path
  end

  private

  def check_auth
    authorize Booking
  end

  def set_buyer_bookings
    # Sets the current logged in user's bookings
    @booking = Booking.where(user_profile_id: current_user.user_profile.id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def booking_params
    return params.require(:booking).permit(:address, :date, :comment)
  end
end