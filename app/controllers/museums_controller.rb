class MuseumsController < ApplicationController
    attr_accessor :name, :description, :opening_time, :closing_time, :wheelchair_accessible, :street, :city, :country, :user_id

    def index
        if params[:search]
            @museums = Museum.where("name LIKE ?", "%#{search}%")
        else
            @museums = Museum.all
        end
    end

    def create

    end

    def new

    end

    def edit

    end

    def show

    end

    def update

    end

    def destroy

    end
end