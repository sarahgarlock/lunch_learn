require "rails_helper"

RSpec.describe PhotoService do
  it 'returns a searched photo', :vcr do
    photo = PhotoService.new.get_photo("India")

    expect(photo).to be_a(Hash)
    expect(photo).to have_key(:results)

    results = photo[:results].first

    expect(results).to have_key(:alt_description)
    expect(results[:alt_description]).to be_a(String)

    expect(results).to have_key(:urls)
    expect(results[:urls]).to be_a(Hash)
    expect(results[:urls]).to have_key(:small)
    expect(results[:urls][:small]).to be_a(String)
  end
end
