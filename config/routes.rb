Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :update, :destroy]
      resources :weeks, only: [:index, :create, :update, :destroy]
      resources :blogs, only: [:index, :create, :update, :destroy]
      resources :co_of_interests, only: [:index, :create, :update, :destroy]
      resources :gits, only: [:index, :create, :update, :destroy]
      resources :jobs, only: [:index, :create, :update, :destroy]
      resources :one_to_ones, only: [:index, :create, :update, :destroy]
    end
  end
end
