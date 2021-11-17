class ApplicationController < ActionController::API
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def require_logged_in_user
    unless @current_user
      render json: { errors: "Please log in first" }, status: :unauthorized 
    end
  end

  def prevent_logged_in_user
    if @current_user
      render json: { errors: "You are already logged in" }, status: :unauthorized 
    end
  end
end
