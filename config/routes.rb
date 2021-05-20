Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'

  resources :users, only: [:index]

  resources :projects, only: [:index, :show, :create, :update]

  resources :leads, only: [:index, :show, :create, :update]
end
