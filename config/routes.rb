Rails.application.routes.draw do
  resources :ratings
  resources :users
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  # get '/review', to: 'static_pages/review'
  get 'static_pages/rate'
  get '/signup', to: 'users#new'

end
