require "rails_helper"

RSpec.describe LearningResourcesFacade do
  describe "resource" do
    it "returns a searched photo and video objects", :vcr do
      resource = LearningResourcesFacade.new.resource("India")

      expect(resource).to be_a(LearningResource)
      expect(resource.country).to eq("India")

      expect(resource.photo.first).to be_a(Photo)
      expect(resource.photo.first.alt_tag).to be_a(String)
      expect(resource.photo.first.url).to be_a(String)

      expect(resource.video).to be_a(Video)
      expect(resource.video.title).to be_a(String)
      expect(resource.video.youtube_video_id).to be_a(String)
    end
  end
end