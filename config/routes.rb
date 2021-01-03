Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  
  resources :users
  resources :products do
    resources :records, only: [:index, :new, :create] 
    resources :comments, only: [:create, :new]
  end

  

end
