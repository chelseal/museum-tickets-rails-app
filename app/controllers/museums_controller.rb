class MuseumsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    skip_before_action :verify_authenticity_token

    def index
        if params[:search] && !params[:search].empty?
            search = params[:search].downcase
            @museums = Museum.where("lower(name) LIKE ?", "%#{search}%")
        else
            @museums = Museum.all
        end
    end

    def create
        museum = current_user.build_museum(museum_params)
        if museum.save
            redirect_to museum_path(museum)
        #will not return user to their own museum page, it will send them to the public museum page
        else
            render :new
        end
    end

    def new
        @museum = Museum.new
    end

    def edit
        @museum = current_user.museum
    end

    def show
        @museum = Museum.find(params[:id])
    end

    def update
        @museum = Museum.find(params[:id])
        if @museum.update(museum_params)
            redirect_to(@museum)
        else
            p "works"
        end
    end

private
    def museum_params
        params.require(:museum).permit(:name, :description, :opening_time, :closing_time, :wheelchair_accessible, :street, :city, :country, :pic)
    end
end