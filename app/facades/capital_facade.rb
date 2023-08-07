class CapitalFacade
  def get_capital(country)
    request = service.get_capital(country)
    capital = request[0][:capital][0]
    Capital.new(capital)
  end

  def service
    CapitalService.new
  end
end