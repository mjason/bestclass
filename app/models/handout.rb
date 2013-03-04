class Handout
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String

  mount_uploader :accessory, HandoutUploader

  belongs_to :course

end
