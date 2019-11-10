class StylesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @name = ["Abstract", "Abstract Expressionism", "Conceptual", "Cubist", "Expressionist", "Fauvism", "Figurative", "Impressionist", "Minimalsim", "Naive", "Photorealist", "Pop", "Primitive", "Realism", "Representational", "Surrealism"]
        if params[:search].empty?
            @styles = Style.where("name LIKE ?", "%#{search}%")
        else
            @styles = Listing.styles.name.find(params[:id])
        end
    end

    def show
        @style = Style.find(params[:id])
    end
end