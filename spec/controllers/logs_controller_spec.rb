require 'rails_helper'

RSpec.describe LogsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET download" do
    it "returns http success" do
      get :download
      expect(response).to be_success
    end
  end

end
