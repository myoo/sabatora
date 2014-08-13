Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :communities do
    resources :joinings, controller: "communities/joinings"
    resources :rooms, to: "communities/rooms"
  end

  resources :characters
end
