require "rails_helper"

RSpec.describe Video do
  it "exists and has attributes" do
    data = {
      :id => {
        :videoId => "q4ICEj4d2Ac"
      },
      :snippet => {
        :title => "Lil Durk - India (Official Audio)"
      }
    }

    video = Video.new(data)

    expect(video).to be_a(Video)
    expect(video.youtube_video_id).to eq("q4ICEj4d2Ac")
    expect(video.title).to eq("Lil Durk - India (Official Audio)")
  end
end