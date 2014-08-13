require "rails_helper"

RSpec.describe Communities::RoomsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/communities/rooms").to route_to("communities/rooms#index")
    end

    it "routes to #new" do
      expect(:get => "/communities/rooms/new").to route_to("communities/rooms#new")
    end

    it "routes to #show" do
      expect(:get => "/communities/rooms/1").to route_to("communities/rooms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/communities/rooms/1/edit").to route_to("communities/rooms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/communities/rooms").to route_to("communities/rooms#create")
    end

    it "routes to #update" do
      expect(:put => "/communities/rooms/1").to route_to("communities/rooms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/communities/rooms/1").to route_to("communities/rooms#destroy", :id => "1")
    end

  end
end
