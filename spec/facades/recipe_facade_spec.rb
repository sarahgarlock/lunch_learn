require "rails_helper"

RSpec.describe RecipeFacade do
  describe "get_recipes" do
    it "returns a recipe object", :vcr do
      get_recipes = RecipeFacade.new.get_recipes("Jamaica")
      
      expect(get_recipes).to be_an(Array)
      expect(get_recipes.first).to be_a(Recipe)
      expect(get_recipes.first.title).to be_a(String)
      expect(get_recipes.first.url).to be_a(String)
      expect(get_recipes.first.country).to be_a(String)
      expect(get_recipes.first.image).to be_a(String)  
    end
  end
end