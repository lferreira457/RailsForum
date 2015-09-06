Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :posts do
    resources :comments
  end

  root 'posts#index'
end
