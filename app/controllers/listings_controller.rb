class ListingsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_auth, except: [:index, :show]
  before_action :set_listing, only: [:show, :update, :destroy, :edit]
  before_action :set_categories, only: [:create, :new, :edit, :update]
  before_action :set_menus, only: [:show]

  def index
    # Queries the database only for the title and id of all listings
    @listing = Listing.select(:title, :id).order(:title)
    @sellerlisting = Listing.where(user_profile_id: current_user.user_profile.id).select(:title, :id) if user_signed_in?
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    begin
    # Creates a new listing using strong params passed through from the creation form
    # Adds current user's profile ID to @listing as attribute
      @listing = Listing.new(listing_params.merge(user_profile_id: current_user.user_profile.id))
      @listing.save!
      redirect_to @listing
    rescue
      flash[:alert] = @listing.errors.full_messages.join('<br>')
      render 'new'
    end
  end

  def update
    begin
      @listing.update!(listing_params)
      redirect_to @listing
    rescue
      flash[:alert] = @listing.errors.full_messages.join('<br>')
      render 'edit'
    end
  end

  def edit
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
    return params.require(:listing).permit(:title, :user_profile_id, :truck_img, :menu_img, :price, :listing_description, category_ids:[])
  end
end
