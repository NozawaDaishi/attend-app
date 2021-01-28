Rails.application.routes.draw do
  get 'passwords/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "attends#index"
  resources :users do
    get "search", on: :collection
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/class/:klass', to: 'attends#index'
  get '/users/class/:klass', to: 'users#index'

  resources :passwords, only: [:show, :edit, :update]
end
