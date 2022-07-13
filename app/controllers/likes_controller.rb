# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(user: current_user)

    if @like.save
      redirect_to post_path(@post)
    else
      redirect_to(@post, alert: t('errors.general'))
    end
  end

  def destroy
    @like = PostLike.find_by(id: params[:id])

    if @like
      @like.destroy
      @post = @like.post
      redirect_to(@post)
    else
      redirect_to(Post.find(params[:post_id]), alert: t('errors.general'))
    end
  end
end
