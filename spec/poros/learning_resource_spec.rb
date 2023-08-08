require "rails_helper"

RSpec.describe LearningResource do
  it "exists and has attributes" do
    data = {
      :country => "India",
      :photo => "https://www.flickr.com/photos/144365873@N07/albums/72157661556391756",
      :video => "https://www.youtube.com/watch?v=0V5BwTruJv8"
    }

    resource = LearningResource.new("India", "https://www.flickr.com/photos/144365873@N07/albums/72157661556391756", "https://www.youtube.com/watch?v=0V5BwTruJv8")


  end
end