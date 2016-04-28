class Api::CommentersController < ApplicationController
  def show
    @comment = Comment.find(params[:comment_id])
    commenter_id = @comment.commenter_id
    @commenter = User.find(commenter_id)
    render json: @commenter
  end
end
