class TodosController < ApplicationController
  before_action :set_project
  before_action :set_project_todo, only: [:show, :update, :destroy]

  def index
    json_response @project.todos
  end

  def show
    json_response @todo
  end

  def create
    todo = @project.todos.create! todo_params
    json_response todo, :created
  end

  def update
    @todo.update todo_params
    head :no_content
  end

  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    params.permit :text, :is_completed
  end

  def set_project
    @project = Project.find params[:project_id]
  end

  def set_project_todo
    @todo = @project.todos.find_by!(id: params[:id]) if @project
  end
end