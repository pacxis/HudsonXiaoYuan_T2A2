class ListingsController < ApplicationController
# -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  skip_before_action :verify_authenticity_token
# -------------------------------------REMOVE FOR PRODUCTION------------------------------------

  before_action :authenticate_user!, except:[:index, :show]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def check_auth
  end

end
