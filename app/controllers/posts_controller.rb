class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all.order('created_at DESC')

    render json: @posts, include: ['image_url', 'user', 'likes.user', 'comments.user']
  end

  # GET /posts/:id
  def show
    render json: @post, include: ['image_url', 'user', 'likes.user', 'comments.user']
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(update_post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:content, :image, :user_id)
    end

    # Making sure you can only edit the content of the post
    def update_post_params
      params.require(:post).permit(:content, :image)
    end
end
