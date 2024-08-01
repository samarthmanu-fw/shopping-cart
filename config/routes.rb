Rails.application.routes.draw do

  root 'pages#index'

  get 'carts/show'

  get 'carts/:id' => "carts#show", as: "cart"

  delete 'carts/:id' => "carts#destroy"

  get 'products/search' => "products#search", as: "products_search"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"

  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"

  post 'line_items' => "line_items#create"

  get 'line_items/:id' => "line_items#show", as: "line_item"

  delete 'line_items/:id' => "line_items#destroy"

  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/users/:id' => "orders#show_by_user", as: "orders_by_user"

  get 'orders/users/:id/summary' => "orders#show_summary_by_user", as: "orders_summary_by_user"

  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'users/index'

  get 'users/new'

  get 'users/create'

  get 'pages/secret'

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :custom_action]
  resources :users, only: [:index, :new, :create]
  resources :products
  resources :orders

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
