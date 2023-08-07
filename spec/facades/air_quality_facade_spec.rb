require "rails_helper"

RSpec.describe AirQualityFacade do
  describe "get_air_quality" do
    it "returns an air quality object", :vcr do 
      get_air_quality = AirQualityFacade.new.get_air_quality("Paris")

      expect(get_air_quality).to be_a(AirQuality)
      expect(get_air_quality.city).to be_a(String)
      expect(get_air_quality.type).to be_a(String)
      expect(get_air_quality.city).to be_a(String)
      expect(get_air_quality.aqi).to be_an(Integer)
      expect(get_air_quality.co_concentration).to be_a(Float)
      expect(get_air_quality.pm25_concentration).to be_a(Float)
    end
  end
end