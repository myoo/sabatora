# -*- coding: utf-8 -*-
require 'rails_helper'


RSpec.describe Communities::ScenariosController, :type => :controller do

  login_user
  let(:community) { FactoryGirl.create(:community) }

  describe "GET index" do
    it "assigns all communities_scenarios as @communities_scenarios" do
      scenario = FactoryGirl.create_list(:scenario, 10, community: community)
      get :index, {community_id: community.id}
      expect(assigns(:scenarios)).to eq(scenario)
    end
  end

  describe "GET show" do
    it "assigns the requested scenario as @scenario" do
      scenario = FactoryGirl.create(:scenario)
      get :show, {:id => scenario.to_param, :community_id => scenario.community.id}
      expect(assigns(:scenario)).to eq(scenario)
    end
  end


  describe "GET new" do
    it "assigns a new scenario as @scenario" do
      get :new, {community_id: community.id}
      expect(assigns(:scenario)).to be_a_new(Scenario)
    end
  end

  describe "GET edit" do
    it "assigns the requested scenario as @scenario" do
      scenario = FactoryGirl.create(:scenario)
      get :edit, {:id => scenario.to_param, community_id: scenario.community.id}
      expect(assigns(:scenario)).to eq(scenario)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Scenario" do
        expect {
          post :create, {community_id: community.id, :scenario => FactoryGirl.attributes_for(:scenario)}
        }.to change(Scenario, :count).by(1)
      end

      it "assigns a newly created scenario as @scenario" do
        post :create, {community_id: community.id, :scenario =>  FactoryGirl.attributes_for(:scenario)}
        expect(assigns(:scenario)).to be_a(Scenario)
        expect(assigns(:scenario)).to be_persisted
      end

      it "redirects to the created scenario" do
        post :create, {community_id: community.id, :scenario => FactoryGirl.attributes_for(:scenario, community: community)}
        expect(response).to redirect_to([community, Scenario.last])
      end
    end

    describe "with invalid params" do
      let (:invalid_attributes){ FactoryGirl.attributes_for(:scenario, name: nil) }
      it "assigns a newly created but unsaved scenario as @scenario" do
        post :create, {community_id: community.id, :scenario => invalid_attributes}
        expect(assigns(:scenario)).to be_a_new(Scenario)
      end

      it "re-renders the 'new' template" do
        post :create, {community_id: community.id, :scenario => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:scenario, name: "変更")
      }

      it "updates the requested scenario" do
        scenario = FactoryGirl.create(:scenario, community: community)
        put :update, {:id => scenario.to_param, community_id: community.id, :scenario => new_attributes}
        scenario.reload
        expect(scenario.name).to eq("変更")
      end

      it "assigns the requested communities_scenario as scenario" do
        scenario = FactoryGirl.create(:scenario, community: community)
        put :update, {:id => scenario.to_param, community_id: community.id, :scenario => new_attributes}
        expect(assigns(:scenario)).to eq(scenario)
      end

      it "redirects to the communities_scenario" do
        scenario = FactoryGirl.create(:scenario, community: community)
        put :update, {:id => scenario.to_param, community_id: community.id, :scenario => new_attributes}
        expect(response).to redirect_to([community, scenario])
      end
    end

    describe "with invalid params" do
      let(:invalid_attributes) { FactoryGirl.attributes_for(:scenario, system_id: nil) }
      it "assigns the communities_scenario as @communities_scenario" do
        scenario = FactoryGirl.create(:scenario, community: community)
        put :update, {:id => scenario.to_param, community_id: community, :scenario => invalid_attributes}
        expect(assigns(:scenario)).to eq(scenario)
      end

      it "re-renders the 'edit' template" do
        scenario = FactoryGirl.create(:scenario, community: community)
        put :update, {:id => scenario.to_param, community_id: community, :scenario => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested communities_scenario" do
      scenario = FactoryGirl.create(:scenario, community: community)
      expect {
        delete :destroy, {:id => scenario.to_param, community_id: community.id}
      }.to change(Scenario, :count).by(-1)
    end

    it "redirects to the communities_scenarios list" do
      scenario = FactoryGirl.create(:scenario, community: community)
      delete :destroy, {:id => scenario.to_param, community_id: community.id}
      expect(response).to redirect_to(community_scenarios_url(community))
    end
  end
end
