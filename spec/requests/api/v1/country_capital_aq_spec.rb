require "rails_helper"

RSpec.describe "Country Capital AQ", type: :request do
  describe "happy paths" do
    it 'returns the air quality of a country capital', :vcr do
      get '/api/v1/air_quality?country=italy'

      expect(response).to be_successful

      capital = JSON.parse(response.body, symbolize_names: true)
      
      expect(capital).to be_a(Hash)
    end
  end
end