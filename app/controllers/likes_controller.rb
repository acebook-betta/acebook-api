class LikesController < ApplicationController
  before_action :require_logged_in_user, only: [:create]
  before_action :set_like, only: [:destroy]
  before_action :authorize, only: [:destroy]
  before_action :prevent_duplicates, only: [:create]

  def create
    if params[:comment_id]
      @like = Like.new(comment_id: params[:comment_id], user_id: @current_user.id)
    elsif params[:post_id]
      @like = Like.new(post_id: params[:post_id], user_id: @current_user.id)
    else
      render json: { status: 422 }
    end

    if @like.save
      render json: @like, status: :created, include: ['like']
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/:id
  def destroy
    @like.destroy
  end

  private
    def set_like
      @like = Like.find(params[:id])
    end

    def authorize
      unless @current_user.id == @like.user_id
        render json: { errors: "You don't have permission to do that" }, status: :unauthorized 
      end
    end

    def like_parmas
      return 
    end

    def prevent_duplicates
      if params[:comment_id]
        if Like.find_by(comment_id: params[:comment_id], user_id: @current_user.id)
          render json: { errors: "You have already liked that comment" }, status: :unauthorized
        end
      end
      if Like.find_by(post_id: params[:post_id], user_id: @current_user.id)
        render json: { errors: "You have already liked that post" }, status: :unauthorized 
      end
    end
end
