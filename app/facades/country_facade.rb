class CountryFacade
  def get_country_data
    request = service.get_random_country
    Country.new(request)
  end

  def get_capital(country)
    request = service.get_capital(country)
    data = request[0][:capital][0]
    Capital.new(data)
  end

  def service
    CountryService.new
  end
end