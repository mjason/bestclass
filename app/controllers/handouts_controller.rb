class HandoutsController < ApplicationController
  expose(:handouts) { Course.find(params[:course_id]).handouts }
  expose(:handout)
end
