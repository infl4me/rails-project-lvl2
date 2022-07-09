class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = PostComment.new(comment_params.merge(post_id: params[:post_id]))

    if @comment.save
      redirect_to @comment.post
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = PostComment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:post_comment).permit(:content)
  end
end
