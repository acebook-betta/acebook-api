class LikesController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  # POST /posts/:post_id/likes
  def create
    @like = Like.new(like_params.merge(post_id: params[:post_id]))

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/:id
  def destroy
    @like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:user_id)
    end
end
