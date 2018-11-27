Rails.application.routes.draw do
  resources :users
  resources :projects
  resources :stages
  resources :comments
  resources :tasks
  resources :components
  root 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
