Rails.application.routes.draw do

  resources :users

  resources :posts do
    resources :comments
  end

  # resources :users do
  #   resources :posts do
  #     resources :comments
  #   end
  # end

end
