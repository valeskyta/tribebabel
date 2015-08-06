class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  load_and_authorize_resource
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params) #coment_params sin S, se la sacamos
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: "Your comment was created"
    else
      redirect_to @post, alert: "Your comment was not created"
    end
  end

  private
  def comment_params #coment_params sin S, se la sacamos
    params.require(:comment).permit(:comment)
  end
end
