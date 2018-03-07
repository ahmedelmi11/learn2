class CommentsController < ApplicationController

def create
  @comment = Comment.new(comment_params)
  @comment.user = current_user
  @ticket_id = params[:ticket_id]
  @comment.ticket_id = @ticket_id
   if @comment.save
    redirect_to ticket_path(@ticket_id)
   else
    render :create
  end
end

private

  def comment_params
   params.require(:comment).permit(:ticket_id, :user_id, :content)
  end
end
