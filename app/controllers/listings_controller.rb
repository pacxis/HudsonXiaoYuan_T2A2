class ListingsController < ApplicationController
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  skip_before_action :verify_authenticity_token
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------

  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listing, only: %i[show update]

  def index
    @listing = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save!
    redirect_to @listing
    # listing = Listing.create(listing_params)
    # redirect_to listing
  end

  def edit; end

  def update
      @listing.update!(listing_params)
      redirect_to @listing
  rescue StandardError
  end

  def destroy; end

  private

  def check_auth; end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    return params.permit(:name, :user_profile_id, :visible, :price, :listing_description)
  end
end
