class Work
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String

  mount_uploader :accessory, WorkUploader

  belongs_to :course
  has_many :tasks

  def submit_percentage
    percentage = self.tasks.length.to_f / self.course.students.length
    (percentage * 100).to_i
  end

  def un_tasks
    tasks = []
    self.tasks.each { |task| tasks << task.user }
    self.course.students.to_a - tasks
  end

end
