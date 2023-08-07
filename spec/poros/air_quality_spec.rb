require "rails_helper"

RSpec.describe AirQuality do
  it 'exists and has attributes' do
    data = {
      :CO=> {
        :concentration=> 216.96,
      },
      :"PM2.5"=> {
        :concentration=> 3.15,
      },
      :overall_aqi=> 35 
    }
    # needs to be exact data

    aq = AirQuality.new(data, "Rome")

    expect(aq).to be_a(AirQuality)
    expect(aq.id).to eq(nil)
    expect(aq.type).to eq("air_quality")
    expect(aq.city).to eq("Rome")
    expect(aq.aqi).to eq(35)
    expect(aq.pm25_concentration).to eq(3.15)
    expect(aq.co_concentration).to eq(216.96)

  end
end