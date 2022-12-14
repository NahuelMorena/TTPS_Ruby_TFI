Rails.application.routes.draw do
  
  devise_for :users
  #Users routes
  resources :users do 
    get "admin/new", to: "users#new", on: :collection
    post "admin/create", to: "users#create", on: :collection
  end

  # Defines the root path route ("/")
  root to: "home#index"

  #Branch_offices routes
  resources :branch_offices do
    get "appointments", to: "branch_offices#appointments", on: :member
  end
  # Rutas que genera resources para branch_offices

  # get "branch_offices", to: "branch_offices#index"
  # get "branch_offices/new", to: "branch_offices#new"
  # get "branch_offices/:id", to: "branch_offices#show"
  # get "branch_offices/:id/edit", to: "branch_offices#edit"
  # post "branch_offices", to: "branch_offices#create"
  # delete "branch_offices/:id", to: "branch_offices#destroy"
  # patch "branch_offices/:id", to: "branch_offices#update", as: :branch_office
  
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
