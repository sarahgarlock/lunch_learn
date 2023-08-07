require "rails_helper"

RSpec.describe Recipe do
  it "exists and has attributes" do
      data = {
        :recipe => {
          :label => "Chicken Vesuvio",
          :url => "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html",
          :image => "https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg",
        }
      }
      recipe = Recipe.new(data, "Italy")
      
      expect(recipe).to be_a(Recipe)
      expect(recipe.id).to eq(nil)
      expect(recipe.country).to eq("Italy")
      expect(recipe.title).to eq("Chicken Vesuvio")
      expect(recipe.url).to eq("http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html")
      expect(recipe.image).to eq("https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg")
  end
end