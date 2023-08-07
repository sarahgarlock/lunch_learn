require 'rails_helper'

RSpec.describe CountryService do
  it 'returns a ramdom country', :vcr do
    country = CountryService.new.get_random_country

    expect(country).to be_a(Hash)
    expect(country).to have_key(:name)

    expect(country[:name]).to be_a(Hash)
    expect(country[:name]).to have_key(:common)
    expect(country[:name][:common]).to be_a(String)

    expect(country[:name]).to have_key(:official)
    expect(country[:name][:official]).to be_a(String)

    expect(country[:name]).to have_key(:nativeName)
    expect(country[:name][:nativeName]).to be_a(Hash)

  end
end