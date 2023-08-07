class AirQualityFacade
  def get_air_quality(city)
    request = service.get_aq(city)
    AirQuality.new(request, city)
  end

  def service
    AirQualityService.new
  end
end