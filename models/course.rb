class Course < ActiveRecord::Base
  has_many :course_depts
  has_many :depts, through: :course_depts
end