class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update show destroy]
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end    
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, { tag_items: [] } )
  end

  def set_post
    @post = Post.find_by(id: params[:id])
    redirect_to root_path if @post.nil?
  end
end
