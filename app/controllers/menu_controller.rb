class MenuController < ApplicationController
    # -------------------------------------REMOVE FOR PRODUCTION------------------------------------
  skip_before_action :verify_authenticity_token
  # -------------------------------------REMOVE FOR PRODUCTION------------------------------------

  def new
  end
end
