# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
  end

  def show
    @comment = PostComment.new
    @shallow_comments = @post.comments.shallow
    @like = current_user.find_like(@post) if current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(creator: current_user))

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
