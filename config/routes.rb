Rails.application.routes.draw do

  resources :users

  resources :sessions, only: [:create]

  resources :posts do
    resources :comments, :only => [:create]
    resources :likes, :only => [:create]
  end
  # POST /posts/:post_id/comments => comments#create
  # POST /posts/:post_id/likes => likes#create

  resources :comments, :only => [:update, :destroy]
  # PUT /comments/:id => comments#update
  # DELETE /comments/:id => comments#destroy
  resources :likes, :only => [:destroy]
  # DELETE /likes/:id => likes#destroy

end
