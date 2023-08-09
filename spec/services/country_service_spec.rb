require 'rails_helper'

RSpec.describe CountryService do
  it 'returns a ramdom country', :vcr do
    country1 = CountryService.new.get_random_country

    expect(country1).to be_a(Hash)
    expect(country1).to have_key(:name)

    expect(country1[:name]).to be_a(Hash)
    expect(country1[:name]).to have_key(:common)
    expect(country1[:name][:common]).to be_a(String)

    expect(country1[:name]).to have_key(:official)
    expect(country1[:name][:official]).to be_a(String)

    expect(country1[:name]).to have_key(:nativeName)
    expect(country1[:name][:nativeName]).to be_a(Hash)

    country2 = CountryService.new.get_random_country

    country1 != country2 

  end
end