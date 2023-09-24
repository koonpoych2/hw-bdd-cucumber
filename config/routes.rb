Rottenpotatoes::Application.routes.draw do
  post '/movies/search_tmdb' => 'movies#search_tmdb', :as => 'search_tmdb'
  resources :movies
  # map '/' to be a redirect to '/movies'
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  root :to => redirect('/movies')
end
