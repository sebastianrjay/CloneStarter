class Api::ProjectsController < ApplicationController

  before_action :require_logged_in!, only: [:create, :update, :destroy]

  def index
    if(params[:category_id])
      @projects = Project.where("category_id = ?", params[:category_id])
    else
      @projects = Project.all.to_a.sample(3)
    end
    @projects.each do |project|
      project.set_days_left!
      project.set_pct_funded!
    end
    render :index
  end

  def show
    @project = Project.includes(:starter, :comments, :pledgers, :pledges, :rewards)
      .find(params[:id])
    @project.set_days_left!
    @project.set_pct_funded!
    render :show
  end

  def create
    @project = Project.new(project_params)
    @project.starter_id = current_user.id
    @project.pledge_total = 0
    if @project.save
      render json: @project
    else
      render json: { messages: @project.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes!(project_params)
    render json: @project
  end

  private

    def project_params
      params.require(:project).permit(
        :title, :summary, :description, :fund_goal, :city, :end_date,
          :category_id, :pledge_total, :created_at, :updated_at,
            :main_image_url, :secondary_image_url
      )
    end
end
