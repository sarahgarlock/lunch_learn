class  Api::V1::AirQualityController < ApplicationController

  def index
    city = CountryFacade.new.get_capital(params[:country])
    air_quality = AirQualityFacade.new.get_air_quality(city.capital[0][:capital][0])
    render json: AirQualitySerializer.new(city, air_quality)
  end
end
