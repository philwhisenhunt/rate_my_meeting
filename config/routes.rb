Rails.application.routes.draw do
  resources :ratings
  resources :users
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # get '/review', to: 'static_pages/review'
  get 'static_pages/rate'
  get '/signup', to: 'users#new'

end
