Rails.application.routes.draw do

  get '/byebug_me' => 'neighborhoods#byebug_me'

  #Neighborhood Routes (Main)
  root 'neighborhoods#index'




  post '/users' => 'users#create'

  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  get '/search/:id' => 'neighborhoods#search'

  get '/admin' => 'admin#home'
  post '/admin' => 'admin#post'
  delete '/admin' => 'admin#destroy'

#Profile routes (to get profile, update information)
  get '/profile' => 'users#profile'

  post '/profile' => 'users#update_prof'

  get '/users/:id' => 'users#profile'

  resources :users, only: [:update, :create]

  get '/reviews' => 'reviews#index'

  post '/reviews' => 'reviews#create'

  delete '/reviews/:id' => 'reviews#destroy'

  resources :neighborhoods, except: [:edit, :update]
  get '/neighborhoods/:id/edit' => 'admin#home'
  patch '/neighborhoods/:id' => 'admin#update'
  put '/neighborhoods/:id' => 'admin#update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
