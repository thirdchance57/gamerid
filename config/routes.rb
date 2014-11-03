Rails.application.routes.draw do

  root 'gamertags#index'

  resource :sessions, only: [:create, :new, :destroy]

  # resources :users
  # users
  get 'users/' => 'users#index'

  get 'users/new' => 'users#new', as: :new_user

  get 'users/:id' => 'users#show', as: :user

  post 'users/' => 'users#create'

  get 'users/:id/edit' => 'users#edit', as: :edit_user

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy', as: :delete_user
  # end of users

  # gamertags
  get 'gamertags/' => 'gamertags#index'

  get 'gamertags/new' => 'gamertags#new'

  get 'gamertags/:id' => 'gamertags#show', as: :gamertag

  post 'gamertags/' => 'gamertags#create'

  get 'gamertags/:id/edit' => 'gamertags#edit', as: :edit_gamertag

  patch 'gamertags/:id' => 'gamertags#update'

  delete 'gamertags/:id' => 'gamertags#destroy'
  # end of gamer_tags routes


  # games
  get 'games/' => 'games#index'

  get 'games/new' => 'games#new'

  get 'games/:id' => 'games#show', as: :game

  post 'games/' => 'games#create'

  get 'games/id:/edit' => 'games#edit', as: :edit_game

  patch 'games/:id' => 'games#update'

  delete 'games/:id' => 'games#destroy'
  # end of games routes

  # platforms
  get 'platforms/' => 'platforms#index'

  get 'platforms/new' => 'platforms#new'

  get 'platforms/:id' => 'platforms#show', as: :platform

  post 'platforms/' => 'platforms#create'

  get 'platforms/id:/edit' => 'platforms#edit', as: :edit_platform

  patch 'platforms/:id' => 'platforms#update'

  delete 'platforms/:id' => 'platforms#destroy'
  # end of platforms routes

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
