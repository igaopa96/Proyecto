Rails.application.routes.draw do

  resources :movements
  resources :goals
  resources :warranties
  resources :concepts
  resources :accounts 
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  
  get 'main', to: 'home#dashboard', as: 'dashboard' 
  get 'mi_familia/:id', to: 'familia#mi_familia', as: 'mi_familia' 
  get 'registro_familia', to: 'familia#registro_nueva_fam', as: 'registro_familia'
  
end
