class HandoutsController < ApplicationController
  expose(:handouts) { Course.find(params[:course_id]).handouts }
  expose(:handout)

  def download
    @handout = Handout.find(params[:handout_id])
    send_file @handout.accessory_pdf, x_sendfile: true
  end

  def swf
    @handout = Handout.find(params[:handout_id])
    send_file @handout.accessory_swf, x_sendfile: true
  end
end