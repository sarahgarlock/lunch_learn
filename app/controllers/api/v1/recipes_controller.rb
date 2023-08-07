class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].present?
      @recipes = RecipeFacade.new.get_recipes(params[:country])
    else
      country = CountryFacade.new.get_country_data
      @recipes = RecipeFacade.new.get_recipes(country.name)
    end
    
    render json: RecipeSerializer.new(@recipes)
  end
end