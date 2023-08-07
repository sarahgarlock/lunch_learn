require "rails_helper"

RSpec.describe AirQualityService do
  it "returns the Air Quality for the capital of a given country", :vcr do
    aq = AirQualityService.new.get_aq("paris")
    
    expect(aq).to be_a(Hash)
    expect(aq).to have_key(:CO)

    expect(aq[:CO]).to be_a(Hash)
    expect(aq[:CO]).to have_key(:concentration)
    expect(aq[:CO]).to have_key(:aqi)

    expect(aq).to have_key(:NO2)
    expect(aq[:NO2]).to be_a(Hash)

    expect(aq).to have_key(:O3)
    expect(aq[:O3]).to be_a(Hash)

    expect(aq).to have_key(:SO2)
    expect(aq[:SO2]).to be_a(Hash)

    expect(aq).to have_key(:"PM2.5")
    expect(aq[:"PM2.5"]).to be_a(Hash)

    expect(aq).to have_key(:PM10)
    expect(aq[:PM10]).to be_a(Hash)

    expect(aq).to have_key(:overall_aqi)
    expect(aq[:overall_aqi]).to be_a(Integer) 
  end
end