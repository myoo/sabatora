require 'rails_helper'

RSpec.describe "Communities::Illustrations", :type => :request do
  describe "GET /communities_illustrations" do
    it "works! (now write some real specs)" do
      get communities_illustrations_path
      expect(response.status).to be(200)
    end
  end
end
