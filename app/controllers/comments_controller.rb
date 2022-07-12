class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = PostComment.new(comment_params.merge(post_id: params[:post_id], user: current_user))

    if @comment.save
      redirect_to post_path(@comment.post, anchor: "comment-#{@comment.id}")
    else
      @post = @comment.post
      redirect_to(@comment.post, alert: @comment.errors.full_messages)
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
