class PostsController < ApplicationController

before_action :authenticate_user!, except: :index

  def index
    @post = Post.all()
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    @post.update(user_id:current_user.id)
    redirect_to(post_path(@post))
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def add_like
    @post = Post.find(params[:id])
    if !(@post.likes.where(user_id: current_user.id).present?)
      @post.likes.create(user_id: current_user.id)
    end

    redirect_url = params["show"] == "true" ? post_path(@post) : posts_path
    redirect_to redirect_url
  end

  def delete_like
    @post = Post.find(params[:id])
    @post.likes.where({user_id: current_user.id}).first.destroy

    redirect_url = params["show"] == "true" ? post_path(@post) : posts_path
    redirect_to redirect_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
