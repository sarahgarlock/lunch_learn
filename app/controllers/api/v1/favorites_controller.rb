class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      favorites = user.favorites
      render json: FavoriteSerializer.new(favorites)
    else
      render json: { error: "Invalid API Key" }, status: :bad_request
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      favorite = user.favorites.create(favorite_params)
      render json: { message: "Successfully added #{favorite_params[:recipe_title]} to your favorites"}, status: :created
    else
      render json: { error: "Invalid API Key" }, status: :bad_request
    end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end