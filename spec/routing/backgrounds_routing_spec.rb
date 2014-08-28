require "rails_helper"

RSpec.describe BackgroundsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/backgrounds").to route_to("backgrounds#index")
    end

    it "routes to #new" do
      expect(:get => "/backgrounds/new").to route_to("backgrounds#new")
    end

    it "routes to #show" do
      expect(:get => "/backgrounds/1").to route_to("backgrounds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/backgrounds/1/edit").to route_to("backgrounds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/backgrounds").to route_to("backgrounds#create")
    end

    it "routes to #update" do
      expect(:put => "/backgrounds/1").to route_to("backgrounds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/backgrounds/1").to route_to("backgrounds#destroy", :id => "1")
    end

  end
end
