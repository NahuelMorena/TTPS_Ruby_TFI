Rails.application.routes.draw do
  
  devise_for :users
  #Users routes
  resources :users do 
    get "admin/new", to: "users#new", on: :collection
    post "admin/create", to: "users#create", on: :collection
    get "editPassword", to: "users#editPassword", on: :member
  end

  # Defines the root path route ("/")
  root to: "home#index"

  #Branch_offices routes
  resources :branch_offices do
    get "appointments", to: "branch_offices#appointments", on: :member
  end
  
  #Attention_times routes
  resources :attention_times

  #Working_days routes
  resources :working_days

  #Locations routes
  resources :locations

  #Provinces routes
  resources :provinces

  #Appointments routes
  resources :appointments do
    get "attending", to: "appointments#attending", on: :member
    patch "attending", to: "appointments#register_attention", on: :member
  end
end
