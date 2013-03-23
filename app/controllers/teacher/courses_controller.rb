class Teacher::CoursesController < TeacherController
  def index
    @courses = current_user.teach_courses
  end

  def show
    @new_work = current_user.teach_courses.find(params[:id]).works.new
    @course = current_user.teach_courses.find(params[:id])
  end
end
