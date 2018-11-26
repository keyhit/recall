Rails.application.routes.draw do
  resources :stages
  resources :comments
  resources :tasks
  resources :components
  resources :projects
  resources :users
  root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
