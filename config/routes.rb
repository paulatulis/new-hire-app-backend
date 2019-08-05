Rails.application.routes.draw do
  resources :notes
  resources :tasks
  resources :lunches
  resources :users

  post '/login', to: 'sessions#login'
  get '/init-state', to: 'sessions#initState'
  get '/get_yelp', to: 'lunches#get_yelp'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
