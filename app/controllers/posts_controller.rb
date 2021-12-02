class PostsController < ApplicationController

  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @comment = Comment.new
    @contacts = User.all
    @posts = Post.all.order(created_at: :desc)
    @posts_comments = Comment.all.order(created_at: :desc)
    @users = User.all
  end

  def update
    post = Post.find_by(id: id_params)
    post.increment(:likes)
    post.save
    redirect_to posts_url
  end


  private

  def post_params
    params.require(:post).permit(:message, :user_id)
  end

  def id_params
    params.require(:id)
  end
end

