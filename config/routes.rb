Rails.application.routes.draw do
  get 'robby/index'

  get :robby, to: 'robby#index'

  devise_for :users
  get 'welcome/index'
  get 'welcome/ergo_test'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :communities do
    resources :joinings, to: "communities/joinings"
    resources :backgrounds, to: "communities/backgrounds"

    resources :rooms, to: "communities/rooms" do
      resources :players, to: "communities/rooms/players"

      member do
        get :playspace, to: "playroom"
      end
    end
  end

  resources :characters
end
