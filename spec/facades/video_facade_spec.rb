require "rails_helper"

RSpec.describe VideoFacade do
  describe "get_video" do
    it "returns a searched video object", :vcr do
      video = VideoFacade.new.search_video("India")

      expect(video).to be_an(Array)
      expect(video.first).to be_a(Video)
      expect(video.first.title).to be_a(String)
      expect(video.first.youtube_video_id).to be_a(String)
    end
  end
end