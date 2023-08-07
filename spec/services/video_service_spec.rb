require "rails_helper"

RSpec.describe VideoService do
  it 'returns a searched video', :vcr do
    video = VideoService.new.get_video("India")

    expect(video).to be_a(Hash)
    expect(video).to have_key(:items)

    first = video[:items].first

    expect(first).to have_key(:snippet)

    snippet = first[:snippet]

    expect(snippet).to have_key(:title)
    expect(snippet[:title]).to be_a(String)

    expect(snippet).to have_key(:channelId)
    expect(snippet[:channelId]).to be_a(String)
  end
end