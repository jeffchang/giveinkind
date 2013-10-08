Giveinkind::Application.routes.draw do
  
  root "static#index"
  devise_for :users, :controllers => {:registrations => "registrations",
                                      :omniauth_callbacks => "users/omniauth_callbacks"}

  post "needs/search" => "needs#search"
  post "needed_items/search" => "needed_items#search"
  post "needed_items/images" => "needed_items#images"
  post "needed_items/update_subcategories" => "needed_items#update_subcategories"
  post "donor_items/update_subcategories" => "donor_items#update_subcategories"
  get "donor_items/donate/:id" => "donor_items#donate"
  get 'donor_items/logistics/:id' => "donor_items#logistics"

  resources :needs
  resources :needed_items
  resources :donor_items
  resources :collection_spots
  resources :profiles, :only => [:show]

  get "needed_items/newinneed/:need_id" => "needed_items#new"
  get "static/about_us" => "static#about_us"
  get "static/blog" => "static#blog"
  get "static/faqs" => "static#faqs"
  get "static/contact" => "static#contact"
  get "static/index" => "static#index"
  get "static/offered" => "static#offered"
  get "static/browse" => "static#browse"
  get "static/donate" => "static#donate"
  get "static/category" => "static#category"

  resources :locations
  resources :profiles, :only => [:show, :edit]


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
