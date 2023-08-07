require "rails_helper"

RSpec.describe AirQuality do
  it 'exists and has attributes' do
    data = {
      :city => "Rome",
      :attributes => {
        :aqi => 2,
        :pm25_concentration => 3,
        :co_concentration => 4
      }
    }

    aq = AirQuality.new(data, "Italy")

    expect(aq).to be_a(AirQuality)
    expect(aq.id).to eq(nil)
    expect(aq.type).to eq("air_quality")
    expect(aq.city).to eq("Rome")
    expect(aq.aqi).to eq(2)
    expect(aq.pm25_concentration).to eq(3)
    expect(aq.co_concentration).to eq(4)

  end
end