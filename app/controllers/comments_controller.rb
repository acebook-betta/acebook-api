class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  # POST /posts/:post_id/comments
  def create
    @comment = Comment.new(comment_params.merge(post_id: params[:post_id]))

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/:id
  def update
    if @comment.update(comment_params)
      render json: @comment
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
      params.require(:comment).permit(:content, :user_id)
    end
end
