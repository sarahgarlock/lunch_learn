require 'rails_helper'

RSpec.describe Capital do
  it 'exists and has attributes' do
    data = {
      :capital => "Rome"
    }

    capital = Capital.new(data)

    expect(capital).to be_a(Capital)
    expect(capital.capital).to eq("Rome")
    expect(capital.capital).to eq(data[:capital])
  end
end