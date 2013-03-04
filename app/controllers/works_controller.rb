class WorksController < ApplicationController
  expose(:works) { Course.find(params[:course_id]).works }
  expose(:work)

  def upload

  end

end
