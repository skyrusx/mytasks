class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_project, only: [:update, :destroy]

  def index
    @projects = Project.all
    json_response @projects, :ok,
                  {todos: {only: [:id, :text, :is_completed, :project_id]}},
                  [:created_at, :updated_at]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create! project_params
    json_response @project, :created
  end

  def update
    @project.update project_params
    head :no_content
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

  def project_params
    params.permit :title, todos_attributes: [:text, :is_completed]
  end

  def set_project
    @project = Project.find params[:id]
  end
end
