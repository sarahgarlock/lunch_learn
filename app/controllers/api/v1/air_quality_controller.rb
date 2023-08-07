class  Api::V1::AirQualityController < ApplicationController

  def index
    city = CapitalFacade.new.get_capital(params[:country])
    air_quality = AirQualityFacade.new.get_air_quality(city.capital)
    render json: AirQualitySerializer.new(air_quality)
  end
end
