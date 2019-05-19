Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles do
    resources :comment, only: [:new, :create]
  end
end
