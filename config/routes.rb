Rails.application.routes.draw do

  resources :users

  resources :posts do
    resources :comments, :only => [:create]
  end
  # POST /posts/:post_id/comments => comments#create

  resources :comments, :only => [:update, :destroy]
  # PUT /comments/:id => comments#update
  # DELETE /comments/:id => comments#destroy

end
