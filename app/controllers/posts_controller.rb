class PostsController < ApplicationController
  # GET /posts/new
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)      
    end
end
