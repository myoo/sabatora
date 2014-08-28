require 'rails_helper'

RSpec.describe "Backgrounds", :type => :request do
  describe "GET /backgrounds" do
    it "works! (now write some real specs)" do
      get backgrounds_path
      expect(response.status).to be(200)
    end
  end
end
