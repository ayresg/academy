class Department < ActiveRecord::Base
  default_scope { order(name: :asc) }
  has_many :course_depts
  has_many :courses, through: :course_depts
end