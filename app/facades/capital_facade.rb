class CapitalFcade
  def get_capital(country)
    request = service.get_capital(country)
    Capital.new(request)
  end

  def service
    CapitalService.new
  end
end