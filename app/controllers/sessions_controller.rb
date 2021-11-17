class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email]).try(:authenticate, params[:session][:password])
    
    if user
      session[:user_id] = user.id
      render json: user, status: :created, include: ['user']
    else
      render json: { status: :unauthorized }
    end
  end
end
