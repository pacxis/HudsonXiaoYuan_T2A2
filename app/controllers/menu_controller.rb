class MenuController < ApplicationController
    # -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  skip_before_action :verify_authenticity_token
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  before_action :set_listing, only: [:new, :edit, :create]  

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params.merge(listing_id: params[:id]))
    @menu.save!
    redirect_to @listing
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def menu_params
    return params.require(:menu).permit(:title, :listing_id)
  end

  def menu_item_params
    return params.require(:menu_item).permit(:name, :description, :menu_id)
  end
end
