Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :communities do
    resources :joinings, to: "communities/joinings"
    resources :rooms, to: "communities/rooms" do
      resources :players, to: "communities/rooms/players"
    end
  end

  resources :characters
end
