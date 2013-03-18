class TasksController < ApplicationController
  layout "back"
  def create
    @task = current_user.tasks.new
    @task.task = params[:file]
    @task.work = params[:work_id]
    @task.save
  end
  
end
