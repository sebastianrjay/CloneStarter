class Api::RewardsController < ApplicationController

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      render json: @reward
    else
      render json: { messages: @reward.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    if(params[:project_id])
      @rewards = Reward.where("project_id = ?", params[:project_id])
    else
      @rewards = Reward.all
    end
    render json: @rewards
  end

  private

    def reward_params
      params.require(:reward).permit(:project_id, :summary, :est_delivery, :min_amt)
    end
end
