Rails.application.routes.draw do
  resources :comments
  resources :users
  resources :posts

  # maybe nest these inside each other???
end
