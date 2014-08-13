require 'rails_helper'

RSpec.describe "Communities::Rooms", :type => :request do
  describe "GET /communities_rooms" do
    it "works! (now write some real specs)" do
      get communities_rooms_path
      expect(response.status).to be(200)
    end
  end
end
