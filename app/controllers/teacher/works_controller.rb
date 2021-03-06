# coding: utf-8
require 'csv'
class Teacher::WorksController < TeacherController

  def index
    @works = current_user.teach_courses.find(params[:course_id]).works
  end

  def show
    
    if params[:tasks] == "true"
      @work = current_user.teach_courses.find(params[:course_id]).works.find(params[:id])
    else
      @users = current_user.teach_courses.find(params[:course_id]).works.find(params[:id]).un_tasks
    end
  end


  def create
    @works = current_user.teach_courses.find(params[:course_id]).works.new(params[:work])
    if @works.save
      redirect_to(teacher_course_path(params[:course_id]))
    end
  end

  def down_tasks
    tasks = current_user.teach_courses.find(params[:course_id]).works.find(params[:work_id]).tasks
    respond_to do |format|
      format.csv do
        csv_string = CSV.generate do |csv|
          csv << ["email", "Name", "作业名", "分数"]
          tasks.each do |task|
            csv << [task.user.email, task.user.name, task.work.title, task.grade]
          end
        end
        render :text => csv_string
      end
    end
  end

end
