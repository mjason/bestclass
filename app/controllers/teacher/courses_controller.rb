class Teacher::CoursesController < TeacherController
  def index
    @courses = current_user.teach_courses
  end

  def show
    @course = current_user.teach_courses.find(params[:id])
  end
end
