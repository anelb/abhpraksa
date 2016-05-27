Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  
  resources :categories, only: [:show] do
    resources :products, only:[ :show]
  end

  get    '/sign_up'           => 'users#new'
  post   '/sign_up'           => 'users#create'

  get    '/sign_in'           => 'sessions#new'
  post   '/sign_in'           => 'sessions#create'
  delete '/logout'            => 'sessions#destroy'

  post '/cart_item' => 'cart_items#create'
  delete '/cart_item/:cart_item_id' => 'cart_items#destroy', as: :delete_cart_item

  get '/cart' => 'carts#show'
  delete '/cart/:cart_id' => 'carts#destroy', as: :delete_cart

  # resources :cart_items
  # resources :carts
  
  resources :orders, only: [:create]

  namespace :admin do
    resources :users
    get 'dashboard' => 'dashboard#show'
    post '/promote' => 'users#promote'
    post '/demote'  => 'users#demote'
  end

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
