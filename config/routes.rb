Rails.application.routes.draw do
  
  devise_for :users
  resources :posts do
    resources :comments, only: :create
  end
  root 'posts#index'
end
