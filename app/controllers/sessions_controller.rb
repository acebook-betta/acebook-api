class SessionsController < ApplicationController
  before_action :prevent_logged_in_user, only: [:create]
  before_action :require_logged_in_user, only: [:destroy]

  def create
    user = User.find_by(email: params[:session][:email])
    .try(:authenticate, params[:session][:password])
    
    if user
      session[:user_id] = user.id
      render json: user, status: :created, include: ['user']
    else
      render json: { errors: "Invalid email or password" }, status: :unauthorized 
    end
  end

  def destroy
    reset_session
    render json: { status: 200, logged_out: true}
  end

  def logged_in
    if @current_user
      render json: { logged_in: true }
    else
      render json: { logged_in: false }
    end
  end
end
