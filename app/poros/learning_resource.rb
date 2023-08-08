class LearningResource
  attr_reader :id,
              :type,
              :country,
              :video,
              :photo

  def initialize(country, photo, video)
    @id = nil
    @type = "learning resource"
    @country = country
    @video = video
    @photo = photo
  end
end