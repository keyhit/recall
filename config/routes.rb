Rails.application.routes.draw do
  resources :users
  resources :projects
  resources :stages
  resources :comments
  resources :tasks
  resources :components
  get 'session/login', to: 'sessions#login', as: 'login'
  post 'session/create', to: 'sessions#create', as: 'create_session'
  get 'session/logout', to: 'sessions#logout', as: 'loguot'

  root 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
