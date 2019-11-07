class ListingsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    skip_before_action :verify_authenticity_token

    def index
        if params[:search] && !params[:search].empty?
            search = params[:search].downcase
            @listings = Listing.where("lower(title) LIKE ?", "%#{search}%")
        else
            @listings = Listing.all
        end
    end

    #Creates a new listing using the .build method on the logged-in user.
    def create
        listing = current_user.museum.listings.build(listing_params)
        if listing.save
            redirect_to listings_path, flash[:notice] = "Exhibit successfully created"
            #Upon saving the listing, user is redirected to the full listings page
            #If the listing is not saved, the 'new' form wil be rendered for the user to start again
        else
            render :new
        end
    end

    #Reads (displays) 'new' listing form and adds checkboxes for the art styles for the user to add to their new listing
    def new
        @listing = Listing.new
        @styles = Style.all
    end

    def edit
        @listing = Listing.find(params[:id])
    end

    def show
        @listing = Listing.find(params[:id])
        
        if user_signed_in?
            session = Stripe::Checkout::Session.create(
                submit_type: 'book',
                payment_method_types: ['card'],
                line_items: [{
                    name: @listing.title,
                    description:@listing.description,
                    amount: @listing.price,
                    currency: 'aud',
                    quantity: 1,
                }],
                payment_intent_data: {
                    metadata: {
                        user_id: current_user.id,
                        listing_id: @listing.id
                    }
                },
                success_url: root_url + "payments/success?listingId=#{@listing.id}",
                cancel_url: root_url + "listing",
            )

            @session_id = session.id
        end
    end

    def update
        @listing = Listing.find(params[:id])
        if @listing.update_attributes(params[:listing])
            redirect_to listings_path, flash[:notice] = "Exhibit successfully created"
        else
            render :edit
        end
    end

private
    def listing_params
        params.require(:listing).permit(:title, :name, :description, :start_date, :end_date, :curator, :exhibit_patron, :photo_credit, :price, :pic, style_ids:[])
    end
end