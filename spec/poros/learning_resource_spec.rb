require "rails_helper"

RSpec.describe LearningResource do
  it "exists and has attributes" do
    data = {
      :country => "India",
      :photo => "https://www.flickr.com/photos/144365873@N07/albums/72157661556391756",
      :video => "https://www.youtube.com/watch?v=0V5BwTruJv8"
    }

    country = data[:country]
    photo = data[:photo]
    video = data[:video]

    resource = LearningResource.new(country, photo, video)
    
    expect(resource).to be_a(LearningResource)
    expect(resource.country).to eq("India")
    expect(resource.photo).to eq("https://www.flickr.com/photos/144365873@N07/albums/72157661556391756")
    expect(resource.video).to eq("https://www.youtube.com/watch?v=0V5BwTruJv8")

  end
end