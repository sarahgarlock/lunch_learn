require "rails_helper"

RSpec.describe Country do
  it "exists and has a name" do
    data = {
      :name => {
        :common => "Guyana"
      }
    }

    country = Country.new(data)

    expect(country).to be_a(Country)
    expect(country.name).to eq("Guyana")
    expect(country.name).to eq(data[:name][:common])
  end
end