require "rails_helper"

RSpec.describe CapitalFacade do
  describe "get_capital" do
    it "returns a capital object", :vcr do
      capital = CapitalFacade.new.get_capital("italy")
      
      expect(capital).to be_a(Capital)
      expect(capital.capital).to be_a(String)
    end
  end
end