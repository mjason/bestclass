json.array! courses do |course|
  json.(course, :id, :name, :created_at, :updated_at)
end