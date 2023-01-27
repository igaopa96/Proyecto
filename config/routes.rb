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
  get 'mi_familia', to: 'familia#mi_familia', as: 'mi_familia' 
  get  'nuevo_familiar' , to: 'familia#nuevo_familiar', as: 'nuevo_familiar'
  post 'registro_familia', to: 'familia#registro_nuevo_familar', as: 'registro_familia'
  post 'add_reference/:id', to: 'warranties#add_reference', as: 'add_reference'
  get 'warranties/:id/image', to: 'warranties#show_image', as: 'show_image'
  delete 'warranties/:id/:warranty', to: 'warranties#destroy_image', as: 'destroy_images_warranty'
end
