class PhotoService
  def get_photo(search)
    get_url("/search/photos?per_page=10&query=#{search}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.unsplash.com") do |f|
      f.params["client_id"] = ENV["UNSPLASH_API_KEY"]
    end
  end
end