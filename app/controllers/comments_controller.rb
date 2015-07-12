class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params)
    if @comment.save
      redirect_to @post, notice: "Your comment was created"
    else
      redirect_to @post, alert: "Your comment was not created"
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:comment)
  end
end
