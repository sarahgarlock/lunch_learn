class CountryService
  def get_capital(country)
    get_url("/v3.1/name/#{country}?fields=capital")
  end

  def get_random_country
    response = get_url("/v3.1/all")
    country = response.sample
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://restcountries.com")
  end
end