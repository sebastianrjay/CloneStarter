class Api::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @categories.each { |category| category.num_projects = category.projects.length }
    render :index
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end
end
