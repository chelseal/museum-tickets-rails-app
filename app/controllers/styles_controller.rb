class StylesController < ApplicationController
    attr_accessor :name

    def index
        @name = ["Abstract", "Abstract Expressionism", "Conceptual", "Cubist", "Expressionist", "Fauvism", "Figurative", "Impressionist", "Minimalsim", "Naive", "Photorealist", "Pop", "Primitive", "Realism", "Representational", "Surrealism"]
    end

    # def create

    # end

    # def new

    # end

    # def edit

    # end

    def show

    end

    # def update

    # end

    # def destroy

    # end
end