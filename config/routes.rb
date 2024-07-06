Rails.application.routes.draw do
  
  devise_for :users
  resources :posts do
    resources :comments, only: :create
    collection do
      get :user_library
    end
  end
  root 'posts#index'
end
