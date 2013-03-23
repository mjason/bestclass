class Teacher::TasksController < TeacherController
  def update
    task = current_user.teach_courses.find(params[:course_id]).works.find(params[:work_id]).tasks.find(params[:id])
    task.grade = params[:grade]
    respond_to do |wants|
      if task.save
        wants.json { render json: {message: "is ok"}, status: 200}
      else
        wants.json { render json: {message: "is not ok"}, status: 500}
      end
    end
  end
end
