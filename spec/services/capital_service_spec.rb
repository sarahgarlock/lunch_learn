require "rails_helper"

RSpec.describe CapitalService do
  it "returns a capital for a specific country", :vcr do
    capital = CapitalService.new.get_capital("italy")

    expect(capital).to be_an(Array)
    expect(capital.first).to be_a(Hash)

    expect(capital[0]).to have_key(:capital)
    expect(capital[0][:capital][0]).to be_a(String)
    expect(capital[0][:capital][0]).to eq("Rome")
  end
end