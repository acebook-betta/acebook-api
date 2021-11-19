class CommentsController < ApplicationController
  before_action :require_logged_in_user, only: [:create]
  before_action :set_comment, only: [:update, :destroy]
  before_action :authorize, only: [:update, :destroy]

  # POST /posts/:post_id/comments
  def create
    @comment = Comment.new(
      comment_params.merge(user_id: @current_user.id, post_id: params[:post_id])
    )

    if @comment.save
      render json: @comment, status: :created, include: ['comment']
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/:id
  def update
    if @comment.update(comment_params)
      render json: @comment, include: ['comment']
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment.destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def authorize
      unless @current_user.id = @comment.user_id
        render json: { errors: "You don't have permission to do that" }, status: :unauthorized 
      end
    end
end
