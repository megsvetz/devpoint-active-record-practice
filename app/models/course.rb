class Course < ActiveRecord::Base
  belongs_to :account
  has_many :enrollments
  has_many :students, through: :enrollments
end
