Rails.application.routes.draw do

  resources :users

  post :login, to: 'sessions#create'

  delete :logout, to: 'sessions#destroy'

  get :logged_in, to: 'sessions#logged_in'
  # GET /logged_in
  # Checks if the user has a session cookie (which we generate after a login)

  resources :posts do
    resources :comments, :only => [:create]
    resources :likes, :only => [:create]
  end
  # POST /posts/:post_id/comments => comments#create
  # POST /posts/:post_id/likes => likes#create

  resources :comments, :only => [:update, :destroy] do
    resources :likes, :only => [:create]
  end
  # PUT /comments/:id => comments#update
  # DELETE /comments/:id => comments#destroy
  # POST /comments/:comment_id/likes => likes#create

  resources :likes, :only => [:destroy]
  # DELETE /likes/:id => likes#destroy
end
