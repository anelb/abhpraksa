Rails.application.routes.draw do

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
  
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :orders, only: [:create]
  resources :account_activations, only: [:edit]

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :users, except: [:show]
    post '/promote' => 'users#promote'
    post '/demote'  => 'users#demote'
    resources :categories, except: [:show]
    resources :products
    resources :orders, only: [:index, :show]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: [:index, :show] do
        resources :products, only: [:index, :show]
      end
      get    '/sign_up'  => 'users#new'
      post   '/sign_up'  => 'users#create'

      get    '/sign_in'  => 'sessions#new'
      post   '/sign_in'  => 'sessions#create'
      delete '/logout'   => 'sessions#destroy'

    end
  end

  match '/api/v1/*path', to: 'api#no_endpoint', via: :all
  
  
end
