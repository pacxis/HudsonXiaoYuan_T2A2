class ListingsController < ApplicationController
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  skip_before_action :verify_authenticity_token
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------

  # before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listing, only: [:show, :update, :destroy, :edit]
  before_action :set_categories, only: [:create, :new, :edit]
  # before_action :set_user, only: [:create, :new, :edit]

  def index
    @listing = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params.merge(user_profile_id: current_user.user_profile.id))
    @listing.save!
    redirect_to @listing
  end

  def update
    @listing.update!(listing_params)
    redirect_to @listing
  end

  def edit
  end

  def destroy
    @listing.destroy!
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
end
