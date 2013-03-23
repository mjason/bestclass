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

end
