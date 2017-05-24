Rails.application.routes.draw do
  resources :wikis
  
  resources :charges, only: [:new, :create]
  
  resources :downgrade, only: [:new, :create]

  devise_for :users
  
  get 'about' => 'welcome#about'
  
  get 'contact' => 'welcome#contact'

  root 'welcome#index'
end
