require "rails_helper"

RSpec.describe "Learning Resources", type: :request do
  describe "happy paths" do
    it "returns a video and photo objects from searched country", :vcr do
      get "/api/v1/learning_resources?country=india"

      expect(response).to be_successful
      learning_resources = JSON.parse(response.body, symbolize_names: true)

      expect(learning_resources).to be_a(Hash)
      expect(learning_resources).to have_key(:id)
      expect(learning_resources[:id]).to be_nil

      expect(learning_resources).to have_key(:type)
      expect(learning_resources[:type]).to be_a(String)
      expect(learning_resources[:type]).to eq("learning resource")

      expect(learning_resources).to have_key(:country)
      expect(learning_resources[:country]).to be_a(String)

      expect(learning_resources).to have_key(:video)
      expect(learning_resources[:video]).to have_key(:title)
      expect(learning_resources[:video][:title]).to be_a(String)
      expect(learning_resources[:video]).to have_key(:youtube_video_id)
      expect(learning_resources[:video][:youtube_video_id]).to be_a(String)

      expect(learning_resources).to have_key(:photo)
      expect(learning_resources[:photo]).to be_an(Array)
      expect(learning_resources[:photo].first).to have_key(:alt_tag)
      expect(learning_resources[:photo].first[:alt_tag]).to be_a(String)
      expect(learning_resources[:photo].first).to have_key(:url)
      expect(learning_resources[:photo].first[:url]).to be_a(String)
    end
  end

  describe "sad paths" do
    it "returns a blank object if no country is given", :vcr do
      get "/api/v1/learning_resources?country="

      expect(response).to be_successful

      blank_response = JSON.parse(response.body, symbolize_names: true)

      expect(blank_response).to be_a(Hash)
      expect(blank_response).to have_key(:id)
      expect(blank_response[:id]).to be_nil

      expect(blank_response).to have_key(:type)
      expect(blank_response[:type]).to be_a(String)

      expect(blank_response).to have_key(:country)
      expect(blank_response[:country]).to be_a(String)

      expect(blank_response).to have_key(:video)
      expect(blank_response[:video]).to be_nil

    end
  end
end