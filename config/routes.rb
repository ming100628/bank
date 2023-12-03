Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  post '/login', to: 'users#signed_in'
  get '/login', to: 'users#login'
  get '/create_user', to: 'users#new'
  post '/create_user', to: 'users#create'
  delete '/logout', to: 'users#logout'
  get '/users', to: 'users#index'
  get '/accounts', to: 'accounts#index'
  get '/transfers', to: 'transactions#new'
  post '/transfers', to: 'transactions#create'
end
