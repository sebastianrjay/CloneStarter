class Api::CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.project_id = params[:project_id]
    @comment.commenter_id = params[:commenter_id]
    if @comment.save
      render json: @comment
    else
      render json: { messages: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    if params[:project_id]
      @comments = Comment.where("project_id = ?", params[:project_id])
    else
      @comments = Comment.all
    end
    render :index
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
