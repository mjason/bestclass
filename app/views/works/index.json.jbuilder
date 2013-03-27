json.array! @works do |work|
  json.(work, :id, :title, :accessory)
  if params[:query] and params[:query] == "true"
    json.grade work.tasks.find_by(user_id: current_user.id).grade
  end
end