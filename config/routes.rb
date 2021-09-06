Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about'
  get 'homes/contact'
  
  devise_for :users
  resources :blogs, only: [:new, :create, :edit, :update, :show, :destroy]
end
