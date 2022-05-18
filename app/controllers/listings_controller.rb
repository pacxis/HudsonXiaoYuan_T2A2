class ListingsController < ApplicationController
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  skip_before_action :verify_authenticity_token
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------

  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listing, only: [:show, :update, :destroy]
  before_action :set_categories, only: [:create, :new]
  before_action :set_user, only: [:create, :new]

  def index
    @listing = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    
    # listing = Listing.create!(listing_params)
    # render json: listing_params
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save!
    redirect_to listing
    # render json: listing_params
  end

  def update
    @listing.update!(listing_params)
    redirect_to @listing
  end

  def destroy
    @listing.destroy
    redirect_to root_path
  end

  private

  def check_auth
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def set_categories
    @categories = Category.order(:name)
  end

  def listing_params
    return params.require(:listing).permit(:title, :user_profile_id, :visible, :price, :listing_description, category_ids:[])
  end

  def set_user
    return @users = UserProfile.all
  end
end
