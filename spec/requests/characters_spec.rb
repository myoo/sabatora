require 'rails_helper'

RSpec.describe "Characters", :type => :request do
  describe "GET /characters" do
    it "works! (now write some real specs)" do
      get characters_path
      expect(response.status).to be(200)
    end
  end
end
