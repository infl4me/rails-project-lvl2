class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = PostLike.new(post_id: params[:post_id], user_id: current_user.id)

    if @like.save
      redirect_to post_path(@like.post)
    else
      @post = @like.post
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
