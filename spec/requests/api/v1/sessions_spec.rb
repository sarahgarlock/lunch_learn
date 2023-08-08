require "rails_helper"

RSpec.describe "Sessions API" do
  describe "happy path" do
    it "can create a session for a user" do
      user = create(:user, password: "password")

      login = {
        :email => user.email,
        :password => "password"
      }

      post "/api/v1/sessions", params: login

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq("application/json; charset=utf-8")

      login = JSON.parse(response.body, symbolize_names: true)

      expect(login).to be_a(Hash)
      expect(login).to have_key(:data)

      data = login[:data]

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
      
    end
  end
end