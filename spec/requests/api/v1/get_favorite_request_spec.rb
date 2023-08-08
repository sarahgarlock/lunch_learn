require "rails_helper"

RSpec.describe "Get Favorites API", type: :request do
  describe "happy path" do
    it "returns a list of favorites for a specific user" do
      user = create(:user, password: "password", api_key: "jgn983hy48thw9begh98h4539h4")

      favorite_1 = create(:favorite, user_id: user.id)
      favorite_2 = create(:favorite, user_id: user.id)
      favorite_3 = create(:favorite, user_id: user.id)
      favorite_4 = create(:favorite, user_id: user.id)
      favorite_5 = create(:favorite, user_id: user.id)

      get "/api/v1/favorites?api_key=jgn983hy48thw9begh98h4539h4"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json; charset=utf-8")

      favorites = JSON.parse(response.body, symbolize_names: true)

      expect(favorites).to be_a(Hash)
      expect(favorites).to have_key(:data)
      expect(favorites[:data]).to be_an(Array)
      
      data = favorites[:data].first

      expect(data).to be_a(Hash)
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a(String)
      expect(data).to have_key(:type)
      expect(data[:type]).to be_a(String)
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      attributes = data[:attributes]

      expect(attributes).to have_key(:country)
      expect(attributes[:country]).to be_a(String)
      expect(attributes).to have_key(:recipe_link)
      expect(attributes[:recipe_link]).to be_a(String)
      expect(attributes).to have_key(:recipe_title)
      expect(attributes[:recipe_title]).to be_a(String)
      expect(attributes).to have_key(:created_at)
      expect(attributes[:created_at]).to be_a(String)
    end
  end

  describe "sad path" do
    it "returns an error if the api key is invalid" do
      user = create(:user, password: "password", api_key: "jgn983hy48thw9begh98h4539h4")

      favorite_1 = create(:favorite, user_id: user.id)
      favorite_2 = create(:favorite, user_id: user.id)
      favorite_3 = create(:favorite, user_id: user.id)
      favorite_4 = create(:favorite, user_id: user.id)
      favorite_5 = create(:favorite, user_id: user.id)

      get "/api/v1/favorites?api_key=wrong_api_key"

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