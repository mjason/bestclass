json.array! handouts do |handout|
  json.(handout, :id, :title)
  json.download course_handout_download_path(handout.course.id, handout.id)
  json.swf course_handout_swf_path(handout.course.id, handout.id)
end