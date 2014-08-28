require 'rails_helper'

RSpec.describe PlayroomController, :type => :controller do

  describe "GET playspace" do
    it "returns http success" do
      get :playspace
      expect(response).to be_success
    end
  end

end
