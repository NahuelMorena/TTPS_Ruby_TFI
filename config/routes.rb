Rails.application.routes.draw do
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"

  #Branch offices routes
  get "branch_offices", to: "branch_offices#index"
  get "branch_offices/new", to: "branch_offices#new"
  get "branch_offices/:id", to: "branch_offices#show"
  get "branch_offices/:id/edit", to: "branch_offices#edit"
  post "branch_offices", to: "branch_offices#create"
  delete "branch_offices/:id", to: "branch_offices#destroy"
  patch "branch_offices/:id", to: "branch_offices#update", as: :branch_office
  
end
