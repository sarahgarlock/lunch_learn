require "rails_helper"

RSpec.describe "Add Favorite API", type: :request do
  describe "happy path" do
    it "can add a favorite recipe to a user" do
      user = create(:user, password: "password", api_key: "jgn983hy48thw9begh98h4539h4")

      favorite = {
        api_key: "jgn983hy48thw9begh98h4539h4",
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/.....",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }

      post "/api/v1/favorites", params: favorite

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq("application/json; charset=utf-8")

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to be_a(Hash)
      expect(body).to have_key(:success)
      expect(body[:success]).to eq("Successfully added Crab Fried Rice (Khaao Pad Bpu) to your favorites")
    end
  end

  describe "sad path" do
    it "returns invalid no user has that api key" do
      user = create(:user, password: "password", api_key: "jgn983hy48thw9begh98h4539h4")

      favorite = {
        api_key: "wrong_api_key",
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/.....",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }
      
      post "/api/v1/favorites", params: favorite

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(response).to have_http_status(:bad_request)
      expect(response.content_type).to eq("application/json; charset=utf-8")

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to be_a(Hash)
      expect(error_response).to have_key(:error)
      expect(error_response[:error]).to eq("Invalid API Key")
    end
  end
end