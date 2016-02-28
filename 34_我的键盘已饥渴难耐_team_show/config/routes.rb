Rails.application.routes.draw do
  get 'memberships/login'

  get 'memberships/signup'
  get 'memberships/modify'

  # get 'membership/signup'
  post 'memberships/signup_handle'

  # get 'membership/login'

  get 'login/index'

  get 'article/new'

  get 'articles/modify'
  post 'articles/modify'
  get 'articles/edt'
  post 'articles/edt_handle'

  get 'notices/modify'
  post 'notices/modify'
  get 'notices/edt'
  post 'notices/edt_handle'

  get  'projects/modify'
  post 'projects/modify'
  get 'projects/edt'
  post 'projects/edt_handle'
  get 'projects/add_status'
  post 'projects/add_status_handle'
  get 'projects/add_members'
  post 'projects/add_members'
  get 'projects/my_projects'

  get 'article/_nav'

  get 'welcome/_nav'

  get 'welcome/nav'
  get 'welcome/error'

  get 'welcome/project'

  get 'welcome/notice'

  get 'welcome/notice'

  get 'welcome/article'

  get 'welcome/index'

  get 'welcome/about_us'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'welcome#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :articles
  resources :notices
  resources :projects
  resources :memberships
  resources :member
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
