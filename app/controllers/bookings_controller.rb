class BookingsController < ApplicationController

  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  skip_before_action :verify_authenticity_token
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  before_action :set_listing, only: [:new, :create]
  before_action :set_user_bookings, only: [:index, :create]


  def index
    # @booking = Booking.includes(:user_profile_id).where(current_user.user_profile.id)
    @booking = Booking.where(user_profile_id: current_user.user_profile.id)
    # @title = 
  end

  def seller_index
    @bookings = Booking.where()
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params.merge(user_profile_id: current_user.user_profile.id, listing_id: params[:id]))
    @booking.save!
    redirect_to bookings_path_url
  end

  private

  def check_auth
    authorize Booking
  end

  def set_user_bookings
    @booking = Booking.where(user_profile_id: current_user.user_profile.id)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def booking_params
    return params.require(:booking).permit(:address, :date)
  end
end