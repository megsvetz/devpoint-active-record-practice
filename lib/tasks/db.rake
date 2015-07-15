namespace :db do
  desc "Populates the DB with accounts, students, enrollments, and courses"
  task populate: :environment do
    require 'populator'
    require 'faker'
    Account.populate 10 do |account|
      account.name = Faker::Name.name
      Course.populate 100 do |course, index|
        course.account_id = account.id
        course_name = index == 1 ? 'Math 101' : Faker::Name.name
        course.name = course_name
        course.code = Faker::Number.digit
        course.start = Faker::Date.backward(500)
        course.end = Faker::Date.forward(500)
        Enrollment.populate 20 do |enrollment|
          enrollment.course_id = course.id
          Student.populate 1 do |student|
            student.name = Faker::Name.name
            student.email = Faker::Internet.email
            student.about = Faker::Lorem.paragraph
            student.gpa = Faker::Number.between(0.0, 4.0)
            student.gender = ['Male', 'Female'].sample
            student.account_id = account.id
            enrollment.student_id = student.id
            puts "Enrollment created for Student: #{student.name} in Course: #{course.name}"
          end
        end
      end
    end
    puts 'Database Populated!'
  end
end
