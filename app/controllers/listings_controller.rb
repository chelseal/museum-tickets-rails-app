class ListingsController < ApplicationController

    def index
        if params[:search] && !params[:search].empty?
            @listings = Listing.where("name LIKE ?", "%#{search}%")
        else
            @listings = Listing.all
        end
    end

    def create

    end

    def new
        @listing = Listing.new
        @styles = Style.all
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