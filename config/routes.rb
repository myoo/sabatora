Rails.application.routes.draw do
  get 'help/about'

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
    resources :illustrations, to: "communities/illustrations"

    resources :rooms, to: "communities/rooms" do
      resources :players, to: "communities/rooms/players"

      member do
        get :playspace, to: "playroom"
        get 'playspace/main_chat_log', to: "playroom#get_main_chat_log"
        get 'playspace/illustrations', to: "playroom#get_illustrations"
        get :character_status
        get :member_statuses, to: "playroom#get_member_statuses"
      end
    end
  end

  get 'logs', to: "logs#index"
  get 'logs/result'
  get 'logs/download'

  resources :profiles, except: [:index]

  resources :characters do
    member do
      post :update_params
      post :edit_params
    end
  end
end
