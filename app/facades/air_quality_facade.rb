class AirQualityFacade
  def get_air_quality(country)
    request = service.get_air_quality(country)
    AirQuality.new(request)
  end

  def service
    AirQualityService.new
  end
end