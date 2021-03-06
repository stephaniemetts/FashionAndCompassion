Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # devise_scope :user do
  #   root :to => 'devise/sessions#new'
  # end

  devise_scope :user do
   authenticated :user do
     # Route authenticated users to home page if they visit root
     root 'home#index', as: :authenticated_root
     # Route all resources normally if authenticated
     resources :products


     get 'report' => 'report#index'
     get 'report/changes' => 'report#changes'
     get 'report/low' => 'report#low'
     get 'report/on_hand' => 'report#on_hand'
     get 'report/value' => 'report#value'
     get 'report/turnover' => 'report#turnover'

   end

   unauthenticated :user do
     # Route unauthenticated users to sign in page regardless of url they visit
     root 'devise/sessions#new', as: :unauthenticated_root
     get '*path' => redirect('/')
   end
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
