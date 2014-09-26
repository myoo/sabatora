require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe BackgroundsController, :type => :controller do
  pending
  
  # This should return the minimal set of attributes required to create a valid
  # Background. As you add validations to Background, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BackgroundsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all backgrounds as @backgrounds" do
      background = Background.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:backgrounds)).to eq([background])
    end
  end

  describe "GET show" do
    it "assigns the requested background as @background" do
      background = Background.create! valid_attributes
      get :show, {:id => background.to_param}, valid_session
      expect(assigns(:background)).to eq(background)
    end
  end

  describe "GET new" do
    it "assigns a new background as @background" do
      get :new, {}, valid_session
      expect(assigns(:background)).to be_a_new(Background)
    end
  end

  describe "GET edit" do
    it "assigns the requested background as @background" do
      background = Background.create! valid_attributes
      get :edit, {:id => background.to_param}, valid_session
      expect(assigns(:background)).to eq(background)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Background" do
        expect {
          post :create, {:background => valid_attributes}, valid_session
        }.to change(Background, :count).by(1)
      end

      it "assigns a newly created background as @background" do
        post :create, {:background => valid_attributes}, valid_session
        expect(assigns(:background)).to be_a(Background)
        expect(assigns(:background)).to be_persisted
      end

      it "redirects to the created background" do
        post :create, {:background => valid_attributes}, valid_session
        expect(response).to redirect_to(Background.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved background as @background" do
        post :create, {:background => invalid_attributes}, valid_session
        expect(assigns(:background)).to be_a_new(Background)
      end

      it "re-renders the 'new' template" do
        post :create, {:background => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested background" do
        background = Background.create! valid_attributes
        put :update, {:id => background.to_param, :background => new_attributes}, valid_session
        background.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested background as @background" do
        background = Background.create! valid_attributes
        put :update, {:id => background.to_param, :background => valid_attributes}, valid_session
        expect(assigns(:background)).to eq(background)
      end

      it "redirects to the background" do
        background = Background.create! valid_attributes
        put :update, {:id => background.to_param, :background => valid_attributes}, valid_session
        expect(response).to redirect_to(background)
      end
    end

    describe "with invalid params" do
      it "assigns the background as @background" do
        background = Background.create! valid_attributes
        put :update, {:id => background.to_param, :background => invalid_attributes}, valid_session
        expect(assigns(:background)).to eq(background)
      end

      it "re-renders the 'edit' template" do
        background = Background.create! valid_attributes
        put :update, {:id => background.to_param, :background => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested background" do
      background = Background.create! valid_attributes
      expect {
        delete :destroy, {:id => background.to_param}, valid_session
      }.to change(Background, :count).by(-1)
    end

    it "redirects to the backgrounds list" do
      background = Background.create! valid_attributes
      delete :destroy, {:id => background.to_param}, valid_session
      expect(response).to redirect_to(backgrounds_url)
    end
  end

end
