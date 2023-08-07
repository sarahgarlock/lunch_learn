require "rails_helper"

RSpec.describe "Recipes API", type: :request do
  describe "happy paths" do
    it "returns a list of recipes for a specific country", :vcr do
      get '/api/v1/recipes?country=italy'

      expect(response).to be_successful

      recipe = JSON.parse(response.body, symbolize_names: true)

      expect(recipe).to be_a(Hash)
      expect(recipe).to have_key(:data)

      expect(recipe[:data]).to be_an(Array)
      expect(recipe[:data].first).to have_key(:id)
      expect(recipe[:data].first[:id]).to be_nil

      expect(recipe[:data].first).to have_key(:type)
      expect(recipe[:data].first[:type]).to be_a(String)
      expect(recipe[:data].first[:type]).to eq("recipe")

      expect(recipe[:data].first).to have_key(:attributes)
      expect(recipe[:data].first[:attributes]).to be_a(Hash)

      expect(recipe[:data].first[:attributes]).to have_key(:title)
      expect(recipe[:data].first[:attributes][:title]).to be_a(String)

      expect(recipe[:data].first[:attributes]).to have_key(:url)
      expect(recipe[:data].first[:attributes][:url]).to be_a(String)

      expect(recipe[:data].first[:attributes]).to have_key(:country)
      expect(recipe[:data].first[:attributes][:country]).to be_a(String)

      expect(recipe[:data].first[:attributes]).to have_key(:image)
      expect(recipe[:data].first[:attributes][:image]).to be_a(String)

      expect(recipe[:data].first[:attributes]).to_not have_key(:ingredients)
      expect(recipe[:data].first[:attributes]).to_not have_key(:calories)
      expect(recipe[:data].first[:attributes]).to_not have_key(:cuisineType)
      expect(recipe[:data].first[:attributes]).to_not have_key(:healthLabels)
      expect(recipe[:data].first[:attributes]).to_not have_key(:dishType)
    end

    it "returns a list of recipes for a randomly selected country", :vcr do
      get '/api/v1/recipes'
      expect(response).to be_successful
      
      recipe = JSON.parse(response.body, symbolize_names: true)

      expect(recipe).to be_a(Hash)
      expect(recipe).to have_key(:data)
      expect(recipe[:data]).to be_an(Array)

      first_recipe = recipe[:data].first

      expect(first_recipe).to have_key(:id)
      expect(first_recipe[:id]).to be_nil

      expect(first_recipe).to have_key(:type)
      expect(first_recipe[:type]).to be_a(String)
      expect(first_recipe[:type]).to eq("recipe")

      expect(first_recipe).to have_key(:attributes)
      expect(first_recipe[:attributes]).to be_a(Hash)

      attributes = first_recipe[:attributes]

      expect(attributes).to have_key(:title)
      expect(attributes[:title]).to be_a(String)

      expect(attributes).to have_key(:url)
      expect(attributes[:url]).to be_a(String)

      expect(attributes).to have_key(:country)
      expect(attributes[:country]).to be_a(String)

      expect(attributes).to have_key(:image)
      expect(attributes[:image]).to be_a(String)

      expect(attributes).to_not have_key(:ingredients)
      expect(attributes).to_not have_key(:calories)
      expect(attributes).to_not have_key(:cuisineType)
      expect(attributes).to_not have_key(:healthLabels)
      expect(attributes).to_not have_key(:dishType)
    end
  end

  describe "sad paths" do
    it "returns an empty array if paramater is an empty string", :vcr do
      get "/api/v1/recipes?country=''"

      expect(response).to be_successful

      recipe = JSON.parse(response.body, symbolize_names: true)

      expect(recipe).to be_a(Hash)
      expect(recipe).to have_key(:data)
      expect(recipe[:data]).to be_an(Array)
      expect(recipe[:data]).to eq([])
      expect(recipe[:data].first).to be_nil
    end

    it "returns an empty array if paramater is not a country", :vcr do
      get "/api/v1/recipes?country=asdf"

      expect(response).to be_successful

      recipe = JSON.parse(response.body, symbolize_names: true)

      expect(recipe).to be_a(Hash)
      expect(recipe).to have_key(:data)
      expect(recipe[:data]).to be_an(Array)
      expect(recipe[:data]).to eq([])
      expect(recipe[:data].first).to be_nil
    end
  end
end