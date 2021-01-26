Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "attends#index"
  resources :users do
    get "search", on: :collection
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/', to: 'attends#index'
  get '/class/:klass', to: 'attends#index'
end
