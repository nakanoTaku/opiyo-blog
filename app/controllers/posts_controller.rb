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

  # POST /posts/:id/edit
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)      
    end
end
