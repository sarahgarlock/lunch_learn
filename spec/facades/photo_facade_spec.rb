require "rails_helper"

RSpec.describe PhotoFacade do
  describe "get_photo" do
    it "returns a searched photo objects", :vcr do
      photo = PhotoFacade.new.search_photo("India")

      expect(photo).to be_an(Array)
      expect(photo.count).to eq(10)
      expect(photo.first).to be_a(Photo)
      expect(photo.first.alt_tag).to be_a(String)
      expect(photo.first.url).to be_a(String)
    end
  end
end