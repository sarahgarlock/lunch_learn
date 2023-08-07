class VideoService
  def get_video(search)
    get_url("/youtube/v3/search?part=snippet&q=#{search}")
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://youtube.googleapis.com") do |f|
      f.params["key"] = ENV["YOUTUBE_API_KEY"]
    end
  end
end