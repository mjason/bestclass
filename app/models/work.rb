class Work
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String

  mount_uploader :accessory, WorkUploader

  belongs_to :course
  has_many :tasks

end
