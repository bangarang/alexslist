class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  before_filter :require_permission, only: [:edit, :update, :destroy]

  def require_permission
    if current_user != Listing.find(params[:id]).user
      redirect_to root_url, alert: "You don't have permission to edit this listing."
      
    end
  end

  respond_to :html, :js

  def index
    @listings = Listing.where "expiry_date > ?", Time.now
    respond_with(@listings)
  end

  def show
    @listing.count += 1
    @listing.save
    respond_with(@listing)
  end

  def new
    @listing = Listing.new
    respond_with(@listing)
  end

  def edit
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.save
    respond_with(@listing)
  end

  def update
    @listing.update(listing_params)
    respond_with(@listing)
  end

  def destroy
    @listing.destroy
    respond_with(@listing)
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:title, :description, :price, :status, :expiry_date, :user_id, :category_id, :image, :count)
    end
end
