# frozen_string_literal: true

Rails.application.routes.draw do

  resources :attendances
  resources :company_branches
  resources :employees
  devise_for :users
  resources :users
  resources :reports, only: [:index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "attendance#new"
end


