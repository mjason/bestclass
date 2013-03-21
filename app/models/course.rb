class Course
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  belongs_to :teacher, class_name: "User", inverse_of: :teach_courses
  has_and_belongs_to_many :students, class_name: "User", inverse_of: :studies

  has_many :handouts
  has_many :works

end
