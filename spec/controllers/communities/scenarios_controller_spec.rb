# -*- coding: utf-8 -*-
require 'rails_helper'


RSpec.describe Communities::ScenariosController, :type => :controller do

  describe "GET index" do
    it "assigns all communities_scenarios as @communities_scenarios" do
      scenario = FactoryGirl.create_list(:scenario, 10, community_id: 1)
      get :index, {community_id: 1}
      expect(assigns(:scenarios)).to eq(scenario)
    end
  end

  describe "GET show" do
    login_user
    it "assigns the requested communities_scenario as @communities_scenario" do
      scenario = Communities::Scenario.create! valid_attributes
      get :show, {:id => scenario.to_param}, valid_session
      expect(assigns(:communities_scenario)).to eq(scenario)
    end
  end

  pending "あとから" do

  describe "GET new" do
    pending
    it "assigns a new communities_scenario as @communities_scenario" do
      get :new, {}, valid_session
      expect(assigns(:communities_scenario)).to be_a_new(Communities::Scenario)
    end
  end

  describe "GET edit" do
    pending
    it "assigns the requested communities_scenario as @communities_scenario" do
      scenario = Communities::Scenario.create! valid_attributes
      get :edit, {:id => scenario.to_param}, valid_session
      expect(assigns(:communities_scenario)).to eq(scenario)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      pending
      it "creates a new Communities::Scenario" do
        expect {
          post :create, {:communities_scenario => valid_attributes}, valid_session
        }.to change(Communities::Scenario, :count).by(1)
      end

      it "assigns a newly created communities_scenario as @communities_scenario" do
        post :create, {:communities_scenario => valid_attributes}, valid_session
        expect(assigns(:communities_scenario)).to be_a(Communities::Scenario)
        expect(assigns(:communities_scenario)).to be_persisted
      end

      it "redirects to the created communities_scenario" do
        post :create, {:communities_scenario => valid_attributes}, valid_session
        expect(response).to redirect_to(Communities::Scenario.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved communities_scenario as @communities_scenario" do
        post :create, {:communities_scenario => invalid_attributes}, valid_session
        expect(assigns(:communities_scenario)).to be_a_new(Communities::Scenario)
      end

      it "re-renders the 'new' template" do
        post :create, {:communities_scenario => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      pending
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested communities_scenario" do
        scenario = Communities::Scenario.create! valid_attributes
        put :update, {:id => scenario.to_param, :communities_scenario => new_attributes}, valid_session
        scenario.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested communities_scenario as @communities_scenario" do
        scenario = Communities::Scenario.create! valid_attributes
        put :update, {:id => scenario.to_param, :communities_scenario => valid_attributes}, valid_session
        expect(assigns(:communities_scenario)).to eq(scenario)
      end

      it "redirects to the communities_scenario" do
        scenario = Communities::Scenario.create! valid_attributes
        put :update, {:id => scenario.to_param, :communities_scenario => valid_attributes}, valid_session
        expect(response).to redirect_to(scenario)
      end
    end

    describe "with invalid params" do
      it "assigns the communities_scenario as @communities_scenario" do
        scenario = Communities::Scenario.create! valid_attributes
        put :update, {:id => scenario.to_param, :communities_scenario => invalid_attributes}, valid_session
        expect(assigns(:communities_scenario)).to eq(scenario)
      end

      it "re-renders the 'edit' template" do
        scenario = Communities::Scenario.create! valid_attributes
        put :update, {:id => scenario.to_param, :communities_scenario => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    pending
    it "destroys the requested communities_scenario" do
      scenario = Communities::Scenario.create! valid_attributes
      expect {
        delete :destroy, {:id => scenario.to_param}, valid_session
      }.to change(Communities::Scenario, :count).by(-1)
    end

    it "redirects to the communities_scenarios list" do
      scenario = Communities::Scenario.create! valid_attributes
      delete :destroy, {:id => scenario.to_param}, valid_session
      expect(response).to redirect_to(communities_scenarios_url)
    end
  end
end
end
