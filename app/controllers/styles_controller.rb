class StylesController < ApplicationController
    attr_accessor :name

    def index
        @name = ["Abstract", "Abstract Expressionism", "Conceptual", "Cubist", "Expressionist", "Fauvism", "Figurative", "Impressionist", "Minimalsim", "Naive", "Photorealist", "Pop", "Primitive", "Realism", "Representational", "Surrealism"]
        if params[:search]
            @styles = Style.where("name LIKE ?", "%#{search}%")
        else
            @styles = Style.all
        end
    end

    def show

    end
end