require "rails_helper"

RSpec.describe Photo do
  it "exists and has attributes" do
    data = {
      :alt_description => "brown concrete building during night time",
      :urls => {
        :small => "https://images.unsplash.com/photo-1581090406930-7e0c3e53d2a5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWF8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"
      }
    }

    photo = Photo.new(data)
    
    expect(photo).to be_a(Photo)
    expect(photo.alt_tag).to eq("brown concrete building during night time")
    expect(photo.url).to eq("https://images.unsplash.com/photo-1581090406930-7e0c3e53d2a5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWF8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80")
  end
end