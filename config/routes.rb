Rottenpotatoes::Application.routes.draw do
  post '/movies/search_tmdb' => 'movies#search_tmdb', :as => 'search_tmdb'
  resources :movies
  # map '/' to be a redirect to '/movies'
  # get 'auth/:provider/callback', to: 'sessions#create'

  post 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/:provider/callback', to: 'sessions#create'
  
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy', as: :logout
  root :to => redirect('/movies')
end
