class VideoFacade
  def search_video(search)
    request = service.get_video(search)
    videos = request[:items].map do |data|
      Video.new(data)
    end
  end

  def service
    VideoService.new
  end
end