Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'

  get '/projects_by_user_id/:id', to: 'projects#showProjectsByUserId'

  get '/leads_by_project_id/:id', to: 'leads#showLeadsByProject'

  get '/current_user', to: 'users#current_user'

  resources :projects, only: [:index, :show, :create, :update]

  resources :leads, only: [:index, :show, :create, :update]

  #resources :users, only: [:index, :show, :create]
  resources :users, param: :id
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'


  #resources :projects, only: [:index, :show, :create, :update]

end
