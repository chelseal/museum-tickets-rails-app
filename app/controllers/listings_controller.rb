class ListingsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    skip_before_action :verify_authenticity_token

    def index
        puts "\n"

        puts params.inspect

        puts "\n"

        puts "params[:search]"

        if params[:search] && !params[:search].empty?
            search = params[:search].downcase
            @listings = Listing.where("lower(title) LIKE ?", "%#{search}%")
        else
            @listings = Listing.all
        end
    end

    def create
        listing = current_user.museum.listings.build(listing_params)
        if listing.save
            redirect_to listings_path
            #will not return user to their own listings page, it will send them to the public listings page
        else
            render :new
        end
    end

    def new
        @listing = Listing.new
        @styles = Style.all
    end

    def edit
        @listings = Listing.all
    end

    def show
        @listing = Listing.find(params[:bob])
    end

    def update
        puts params[:controller]
        render plain: "working"
    end

    def destroy
        puts params[:controller]
        render plain: "working"
    end

private
    def listing_params
        params.require(:listing).permit(:title, :name, :description, :start_date, :end_date, :curator, :exhibit_patron, :photo_credit, :price, :pic, style_ids:[])
    end
end