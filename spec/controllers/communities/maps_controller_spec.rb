# -*- coding: utf-8 -*-
require 'rails_helper'


RSpec.describe Communities::MapsController, :type => :controller do

  let(:user) { FactoryGirl.create(:user, confirmed_at: Time.now)}

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:map, community: community)
  }

  let(:invalid_attributes) {
    { title: "", illust: "aaa" }
  }

  let(:community) { FactoryGirl.create(:community) }

  login_user

  describe "GET index" do
    it "assigns all communities_maps as @communities_maps" do
      maps = FactoryGirl.create_list(:map, 10, community: community, access: ACCESS_LEVEL[:PUBLIC], user: user )
      get :index, {community_id: community.id}
      expect(assigns(:maps)).to eq(maps)
    end
  end

  describe "GET show" do
    it "assigns the requested communities_map as @communities_map" do
      map = FactoryGirl.create(:map, :public, community: community)
      get :show, {:id => map.to_param, community_id: community.id}
      expect(assigns(:map)).to eq(map)
    end
  end

  describe "GET new" do
    it "assigns a new communities_map as @communities_map" do
      get :new, {community_id: community.id}
      expect(assigns(:map)).to be_a_new(Map)
    end
  end

  describe "GET edit" do
    it "assigns the requested communities_map as @communities_map" do
      map = FactoryGirl.create(:map, :public, user: user)
      get :edit, {:id => map.to_param, community_id: community}
      expect(assigns(:map)).to eq(map)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Communities::Map" do
        expect {
          post :create, {:map => valid_attributes, community_id: community.id}
        }.to change(Map, :count).by(1)
      end

      it "assigns a newly created communities_map as @map" do
        post :create, {:map => valid_attributes, community_id: community.id}
        expect(assigns(:map)).to be_a(Map)
        expect(assigns(:map)).to be_persisted
      end

      it "redirects to the created communities_map" do
        post :create, {:map => valid_attributes, community_id: community.id}
        expect(response).to redirect_to([community, Map.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved communities_map as @communities_map" do
        post :create, {:map => invalid_attributes, community_id: community.id}
        expect(assigns(:map)).to be_a_new(Map)
      end

      it "re-renders the 'new' template" do
        post :create, {:map => invalid_attributes, community_id: community.id}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:map, :public, title: "修正")
      }

      it "updates the requested communities_map" do
        map = FactoryGirl.create(:map, community: community, user: user)
        put :update, {:id => map.to_param, :map => new_attributes, community_id: community.id}
        map.reload
        expect(map.title).to eq("修正")
      end

      it "assigns the requested map as @map" do
        map = FactoryGirl.create(:map, community: community, user: user)
        put :update, {:id => map.to_param, :map => valid_attributes, community_id: community.id}
        expect(assigns(:map)).to eq(map)
      end

      it "redirects to the map" do
        map = FactoryGirl.create(:map, community: community, user: user)
        put :update, {:id => map.to_param, :map => valid_attributes, community_id: community.id}
        expect(response).to redirect_to([community, map])
      end
    end

    describe "with invalid params" do
      it "assigns the communities_map as @map" do
        map = FactoryGirl.create(:map, community: community, user: user)
        put :update, {:id => map.to_param, :map => invalid_attributes, community_id: community.id}
        expect(assigns(:map)).to eq(map)
      end

      it "re-renders the 'edit' template" do
        map = FactoryGirl.create(:map, community: community, user: user)
        put :update, {:id => map.to_param, :map => invalid_attributes, community_id: community.id}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested communities_map" do
      map = FactoryGirl.create(:map, community: community, user: user)
      expect {
        delete :destroy, {:id => map.to_param, community_id: community.id}
      }.to change(Map, :count).by(-1)
    end

    # it "redirects to the communities_maps list" do
    #   map =FactoryGirl.create(:map, community: community, user: user)
    #   delete :destroy, {:id => map.to_param, community_id: community.id}
    #   expect(response).to redirect_to(community_maps_url(community))
    # end
  end

end
