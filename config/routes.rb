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
  get 'session/login', to: 'sessions#login', as: 'login'
  post 'session/create', to: 'sessions#create', as: 'create_session'
  get 'session/logout', to: 'sessions#logout', as: 'loguot'

  root 'sessions#login'
      # resources :stages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
