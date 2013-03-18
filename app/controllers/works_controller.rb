class WorksController < ApplicationController
  
  expose(:works) do 
    works = Course.find(params[:course_id]).works
  end

  expose(:work)

  def index
    if params[:query] and params[:query] == "true"
      @works = []
      works.each do |work|
        begin
          work.tasks.find_by(user_id: current_user.id)
          @works << work
        rescue
          next
        end
      end
    elsif params[:query] and params[:query] == "false"
      @works = []
       works.each do |work|
        begin
          work.tasks.find_by(user_id: current_user.id)
        rescue
          @works << work
        end
      end
    else
      @works = works
    end

  end

end