class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :task, TaskUploader

  belongs_to :user
  belongs_to :work

end
