class PhotoFacade
  def search_photo(search)
    request = service.get_photo(search)
    photos = request[:results].map do |data|
      Photo.new(data)
    end
  end

  def service
    PhotoService.new
  end
end