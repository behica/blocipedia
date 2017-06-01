Rails.application.routes.draw do
  get 'collaborators/new'

  get 'collaborators/create'

  get 'collaborators/destroy'

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end
  
  resources :charges

  devise_for :users
  
  get 'about' => 'welcome#about'
  
  get 'contact' => 'welcome#contact'

  root 'welcome#index'
end
