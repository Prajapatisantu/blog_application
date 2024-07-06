class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  def index
    @posts = Post.published
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.author = current_user.email if user_signed_in?

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_url, notice: "Post was successfully deleted."
    else
      redirect_to posts_url, alert: "Something went wrong"
    end
  end

  def user_library
    @user_posts = current_user.posts
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :status, :author, :image, :video)
    end
end
