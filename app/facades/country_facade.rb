class CountryFacade
  def get_country_data
    request = service.get_random_country
    Country.new(request)
  end

  def service
    CountryService.new
  end
end