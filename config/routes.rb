Rails.application.routes.draw do
  resources :company_branches
  resources :employees
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "employees#index"
end
