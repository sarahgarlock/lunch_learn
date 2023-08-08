require "rails_helper"

RSpec.describe "User Login API" do
  describe "happy paths" do
    it "creates a user and returns an api key" do
      user_params = {
        user: {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treats4lyf"
        }
      }

      post "/api/v1/users", params: user_params
      
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq("application/json; charset=utf-8")

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body).to be_a(Hash)
      expect(body).to have_key(:user)

      user = body[:user]

      expect(user).to be_a(Hash)
      expect(user).to have_key(:data)

      data = user[:data]

      expect(data).to be_a(Hash)
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a(String)
      expect(data).to have_key(:type)
      expect(data[:type]).to be_a(String)
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      attributes = data[:attributes]

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)
      expect(attributes).to have_key(:email)
      expect(attributes[:email]).to be_a(String)
      expect(attributes).to have_key(:api_key)
      expect(attributes[:api_key]).to be_a(String)

      expect(attributes).to_not have_key(:password_digest)
      expect(attributes).to_not have_key(:password)
    end
  end

  describe "sad paths" do
    it "returns an error if passwords don't match" do
      user_params = {
        user: {
          name: "Odell",
          email: "goodboy@ruffruff.com",
          password: "treats4lyf",
          password_confirmation: "treats5lyfeee"
        }
      }

      post "/api/v1/users", params: user_params

      expect(response).to_not be_successful
      expect(response.status).to eq(422) # Unprocessable Entity
      expect(response).to have_http_status(:unprocessable_entity)

      error_response = JSON.parse(response.body, symbolize_names: true)

      # expect(error_response).to have_key(:error)

    end
  end
end