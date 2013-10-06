Giveinkind::Application.routes.draw do
  
  root "static_pages#welcome"
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks"}

  resources :needs
  resources :needed_items
  resources :donor_items
  resources :collection_spots
  resources :profiles, :only => [:show]

  post "needed_items/search" => "needed_items#search"
  get "static_pages/about_us" => "static_pages#about_us"
  get "static_pages/blog" => "static_pages#blog"
  get "static_pages/faqs" => "static_pages#faqs"
  get "static_pages/contact" => "static_pages#contact"
  get "static_pages/index" => "static_pages#index"
  get "static_pages/offered" => "static_pages#offered"
  get "static_pages/browse" => "static_pages#browse"
  get "static_pages/donate" => "static_pages#donate"
  get "static_pages/category" => "static_pages#category"

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
