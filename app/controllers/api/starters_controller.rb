class Api::StartersController < ApplicationController
  def show
    if params[:project_id]
      @project = Project.find(params[:project_id])
      @starter = @project.starter
      render json: @starter
    end
  end
end
