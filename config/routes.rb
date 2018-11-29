Rails.application.routes.draw do
  resources :users do 
    resources :projects do
      resources :parts do
        resources :tasks do
          resources :comments
        end
      end
    end
  end
  resources :components
  get 'session/login', to: 'sessions#login', as: 'session_login'
  post 'session/create', to: 'sessions#create', as: 'session_create'
  get 'session/logout', to: 'sessions#logout', as: 'session_loguot'

  root 'users#show'
  # resources :stages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
