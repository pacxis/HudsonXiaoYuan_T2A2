class ListingsController < ApplicationController
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  skip_before_action :verify_authenticity_token
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------

  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_auth, except: [:index, :show]
  before_action :set_listing, only: [:show, :update, :destroy, :edit]
  before_action :set_categories, only: [:create, :new, :edit]
  before_action :set_menus, only: [:show]

  def index
    # Queries the database only for the title and id of all listings
    @listing = Listing.select(:title, :id)
  end

  def seller_index
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    # Creates a new listing using strong params passed through from the creation form
    # Adds current user's profile ID to @listing as attribute
    @listing = Listing.new(listing_params.merge(user_profile_id: current_user.user_profile.id))
    @listing.save!
    redirect_to @listing
  end

  def update
    @listing.update!(listing_params)
    redirect_to @listing
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def destroy
    @listing.destroy!
    redirect_to root_path
  end

  def book
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def set_menus
    @menus = Listing.find(params[:id]).menus
  end

  def set_categories
    @categories = Category.order(:name)
  end

  def check_auth
    authorize Listing
  end

  def listing_params
    return params.require(:listing).permit(:title, :user_profile_id, :visible, :price, :listing_description, category_ids:[])
  end
end
