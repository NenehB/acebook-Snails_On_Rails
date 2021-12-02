class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    p '//////// CREATE ROUTE'
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    p '============== INDEX ROUTE'
    @posts = Post.all
    @image = Image.new(image_params)
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: "Image was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    p post = Post.find_by(id: id_params)
    post.update(likes: (post.likes.to_i + 1 ))
    redirect_to posts_url
  end

  
  private

  def post_params
    params.require(:post).permit(:message)
  end

  def id_params
    p params.require(:id)
  end

  def image_params
    params.require(:image).permit(:title, :caption, :image)
  end

end
