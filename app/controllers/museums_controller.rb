class MuseumsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        if params[:search]
            @museums = Museum.where("name LIKE ?", "%#{search}%")
        else
            @museums = Museum.all
        end
    end

    def create
        puts params[:controller]
        render plain: "working"
    end

    def new
        puts params[:controller]
        render plain: "working"
    end

    def edit
        puts params[:controller]
        render plain: "working"
    end

    def show
        puts params[:controller]
        render plain: "working"
    end

    def update
        puts params[:controller]
        render plain: "working"
    end

    def destroy
        puts params[:controller]
        render plain: "working"
    end
end