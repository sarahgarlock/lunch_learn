class Recipe
  attr_reader :id,
              :title,
              :url,
              :country,
              :image

  def initialize(data, country)
    @id = nil
    @title = "recipe"
    @url = data[:recipe][:url]
    @country = country
    @image = data[:recipe][:image]
  end
end