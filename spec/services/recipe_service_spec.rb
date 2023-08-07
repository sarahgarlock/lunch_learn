require "rails_helper"

RSpec.describe RecipeService do
  it "can search for recipes by country", :vcr do
    search = RecipeService.new.get_recipes("Jamaica")

    expect(search).to be_a(Hash)

    expect(search).to have_key(:count)
    expect(search[:count]).to be_an(Integer)
    expect(search[:count]).to eq(99)

    expect(search).to have_key(:hits)
    expect(search[:hits]).to be_an(Array)

    recipe = search[:hits].first[:recipe]

    expect(recipe).to be_a(Hash)

    expect(recipe).to have_key(:label)
    expect(recipe[:label]).to be_a(String)
    expect(recipe[:label]).to eq("Charles Dickens's Punch Recipe")

    expect(recipe).to have_key(:image)
    expect(recipe[:image]).to be_a(String)

    expect(recipe).to have_key(:url)
    expect(recipe[:url]).to be_a(String)
    expect(recipe[:url]).to eq("http://www.seriouseats.com/recipes/2011/03/drink-the-book-charles-dickenss-punch.html")
  end
end