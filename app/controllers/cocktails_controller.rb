class CocktailsController < ApplicationController
    def index
        @cocktails = Cocktail.all
    end

    def show
        @cocktail = Cocktail.find(params[:id])
    end

    def new
        @cocktail = Cocktail.new
    end

    def create
        @cocktail = Cocktail.new(strong_params)
        if @cocktail.save
            redirect_to cocktail_path(@cocktail)
        else
            render new_cocktail_path
        end
    end

    private
    def strong_params
        params.require(:cocktail).permit(:name, :image_url)
    end
end


# :index, :new, :create, :show