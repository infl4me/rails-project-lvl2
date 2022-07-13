# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to post_path(@post, anchor: "comment-#{@comment.id}")
    else
      redirect_to(@post, alert: @comment.errors.full_messages)
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
