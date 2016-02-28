RailsForum::Application.routes.draw do

    resources :resumes, only: [:index, :new, :create, :destroy]

    concern   :user_comments,  TheComments::UserRoutes.new
    concern   :admin_comments, TheComments::AdminRoutes.new
    resources :comments, concerns:  [:user_comments, :admin_comments]




  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    devise_for :users, :controllers => { :registrations => :registrations, :confirmations => :confirmations }
    get 'user/:id', to: 'users#show', as: 'user'

    resources :categories do
        resources :topics do
            resources :posts


        end
    end

    get 'home/confirm', to: 'home#confirm', as: 'home_confirm'
    get 'home/thanks', to: 'home#thanks', as: 'home_thanks'

    root :to => "categories#index"


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