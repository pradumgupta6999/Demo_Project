Rails.application.routes.draw do

  resources :appointments
  resources :records

  
  resources :patients
  resources :doctors
  resources :hospitals
  # resource :patient 
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
