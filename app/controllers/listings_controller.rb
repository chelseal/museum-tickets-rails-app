class ListingsController < ApplicationController
    attr_accessor :title, :name, :description, :start_date, :end_date, :curator, :exhibit_patron, :photo_credit, :museum_id, :price, :status

    def index
        @listings = Listing.all
    end

    def create

    end

    def new

    end

    def edit

    end

    def show
        @listing = Listing.find(params[:id])
    end

    def update

    end

    def destroy

    end

# private
#     def listing_params
#         params.require(:listing).permit(:title, :name, :description, :start_date, :end_date, :curator, :exhibit_patron, :photo_credit, :museum_id, :price, :status [])
#     end
end