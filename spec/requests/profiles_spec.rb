require 'rails_helper'

RSpec.describe "Profiles", :type => :request do
  describe "GET /profiles" do
    it "works! (now write some real specs)" do
      get profiles_path
      expect(response).to have_http_status(200)
    end
  end
end
