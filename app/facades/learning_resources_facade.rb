class LearningResourcesFacade
  def resource(country)
    photo = PhotoFacade.new.search_photo(country)
    video = VideoFacade.new.search_video(country).first

    LearningResource.new(country, photo, video)
    
    # consider removing since we're not using it in the controller
  end
end