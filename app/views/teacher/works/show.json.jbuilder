if params[:tasks] == "true"
  json.array! @work.tasks do |task|
    json.(task, :id)
    json.url task.task.url
    json.name task.user.name
    json.email task.user.email
  end
else
  json.array! @users do |user|
    json.(user, :id, :name, :email)
  end
end