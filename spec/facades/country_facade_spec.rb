require "rails_helper"

RSpec.describe CountryFacade do
  describe "get_country_data" do
    it "returns a country object", :vcr do
      random_country = CountryFacade.new.get_country_data

      expect(random_country).to be_a(Country)
      expect(random_country.name).to be_a(String)
    end
  end
end