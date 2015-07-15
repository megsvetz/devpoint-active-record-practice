class Account < ActiveRecord::Base
  has_many :students
  has_many :courses
end
