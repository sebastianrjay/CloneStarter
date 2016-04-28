class Api::PledgesController < ApplicationController

  def index
    if(params[:project_id])
      @pledges = Pledge.where("project_id = ?", params[:project_id])
    else
      @pledges = Pledge.all
    end
    render json: @pledges
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.pledger_id = current_user.id
    @project = Project.find(params[:project_id])
    @project.pledge_total += @pledge.amt
    if @pledge.save && @project.save
      render json: @pledge
    else
      render json: { messages: @pledge.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def pledge_params
      params.require(:pledge).permit(:amt, :project_id)
    end
end
