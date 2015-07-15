class Student < ActiveRecord::Base
  belongs_to :account
  has_many :enrollments
  has_many :courses, through: :enrollments
end
