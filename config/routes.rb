Rails.application.routes.draw do

  get '/byebug_me' => 'neighborhoods#byebug_me'

  #Neighborhood Routes (Main)
  root 'neighborhoods#index'

  #Neighborhood Routes
  resources :neighborhoods, except: [:edit, :update]
  get '/neighborhoods/:id/edit' => 'admin#home'
  patch '/neighborhoods/:id' => 'admin#update'
  put '/neighborhoods/:id' => 'admin#update'

  # User Routes
  resources :users, only: [:update, :create]
  post '/users' => 'users#create'

  get '/users/:id/edit' => 'admin#home'
  patch '/users/:id' => 'admin#update'
  put '/users/:id' => 'admin#update'

  delete '/users/:id' => 'users#destroy'

  # Sessions Routes
  post 'sessions' => 'sessions#create'
  post 'sessions' => 'users#create'
  delete 'sessions' => 'sessions#destroy'

  # Search Routes
  get '/search/:id' => 'neighborhoods#search'

  # Admin Routes
  get '/admin' => 'admin#home'

  patch '/neighborhoods/:id' => 'neighborhoods#update'
  post '/neighborhoods' => 'neighborhoods#create'
  delete '/neighborhoods/:id' => 'neighborhoods#destroy'

  #Profile routes (to get profile, update information)
  get '/profile' => 'users#profile'
  post '/profile' => 'users#update_prof'
  get '/users/:id' => 'users#profile'

end
