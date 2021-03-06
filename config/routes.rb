Elbuengusto::Application.routes.draw do
  get "home/index"
  resources :orders

  resources :categories

  resources :product_images

  resources :cart_items

  resources :carts

  # get "store/index"       # Página principal de la tienda que ven los usuarios
  get '/tienda',    to: 'store#index',          as: 'store'

  resources :products

  # get "static/home"
  # get "static/help"
  # get "static/about"
  # get "static/contact"
  # root 'static#home'

  root 'home#index'
  
  match '/ayuda',     to: 'static#help',        via: 'get'
  match '/acercade',  to: 'static#about',       via: 'get'
  match '/contacto',  to: 'static#contact',     via: 'get'

  # Usuarios
  # http://origami.co.uk/blog/2010/02/rails-3-routing-examples
  resources :users do 
    put :batch_update, on: :collection
  end

  # Registro de nuevos usuarios
  match '/registro',    to: 'users#new',        via: 'get'

  # Sesiones
  resources :sessions, only: [:new, :create, :destroy]
  match '/entrar',      to: 'sessions#new',     via: 'get'
  match '/salir',       to: 'sessions#destroy', via: 'delete'

  # Notificaciones
  resources :notifications, only: [:create, :destroy]

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
