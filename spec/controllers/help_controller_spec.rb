require 'rails_helper'

RSpec.describe HelpController, :type => :controller do

  describe "GET about" do
    it "returns http success" do
      get :about
      expect(response).to be_success
    end
  end

end
