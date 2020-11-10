Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  
  resources :users
  resources :products do
    resources :delivery, only: [:index, :create]
  end
  

end
