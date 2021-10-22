Rails.application.routes.draw do

  root to: "static_pages#index"

  get "about", to: "static_pages#about"
  #get "contact", to: "static_pages#contact"
  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  delete "signout", to: "sessions#destroy"

  resources :contacts
  resources :users, only: [:new, :create, :show, :edit, :update]
end
