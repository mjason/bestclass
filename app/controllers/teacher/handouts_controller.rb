class Teacher::HandoutsController < TeacherController

  def create
    handout = current_user.teach_courses.find(params[:course_id]).handouts.new(params[:handout])
    if handout.save
      handout.to_pdf
      handout.to_swf
      handout.save
      redirect_to teacher_course_path(params[:course_id])
    end
  end

end
