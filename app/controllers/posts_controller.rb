class PostsController < ApplicationController
  before_action :require_logged_in_user, only: [:create]
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authorize, only: [:update, :destroy]

  # GET /posts
  def index
    @posts = Post.all.order('created_at DESC')

    render json: @posts, include: ['image_url', 'user', 'likes.user', 'comments.user', 'comments.likes', 'comments.likes.user']
  end

  # GET /posts/:id
  def show
    render json: @post, include: ['image_url', 'user', 'likes.user', 'comments.user', 'comments.likes', 'comments.likes.user']
  end

  # POST /posts
  def create
    @post = Post.new(post_params.merge(user_id: @current_user.id))

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
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
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :image)
    end

    def authorize
      unless @current_user.id = @post.user_id
        render json: { errors: "You don't have permission to do that" }, status: :unauthorized 
      end
    end
end
