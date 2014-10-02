require "rails_helper"

RSpec.describe Communities::ScenariosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/communities/1/scenarios").to route_to("communities/scenarios#index", community_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/communities/1/scenarios/new").to route_to("communities/scenarios#new", community_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/communities/1/scenarios/1").to route_to("communities/scenarios#show", :id => "1", community_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/communities/1/scenarios/1/edit").to route_to("communities/scenarios#edit", :id => "1", community_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/communities/1/scenarios").to route_to("communities/scenarios#create", community_id: "1")
    end

    it "routes to #update" do
      expect(:put => "/communities/1/scenarios/1").to route_to("communities/scenarios#update", :id => "1", community_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/communities/1/scenarios/1").to route_to("communities/scenarios#destroy", :id => "1",  community_id: "1")
    end

  end
end
