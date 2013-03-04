json.(course, :id, :name, :created_at, :updated_at)
json.teacher do
  json.(course.teacher, :name, :id)
end