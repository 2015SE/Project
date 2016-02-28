Rails.application.routes.draw do

root 'songs#index'
resources :sessions, only: [ :new, :create, :destroy ]
resources :users, only: [ :new, :create, :update, :edit, :show ] do
  member do
    get :activate
  end
end
resources :songs do
  resources :comments, only: [ :create, :destroy ]
end
resource :likeship, only: [ :create, :destroy ]
resources :notifications, only: [ :index, :destroy ] do
  collection do
    post :count
    delete :clear
  end
end
resources :password_resets, only: [ :new, :create, :edit, :update]
get 'login', to: 'sessions#new', as: :login
get 'signup', to: 'users#new', as: :signup
delete 'logout', to: 'sessions#destroy', as: :logout
get 'collect', to: 'songs#collect', as: :collect
get 'user_songs', to: 'users#user_songs', as: :user_songs
get 'favorite_songs', to: 'users#favorite_songs', as: :favorite
get 'recent_comments', to: 'users#recent_comments', as: :recent_comments
get 'language', to: 'users#language', as: :set_locale

end
