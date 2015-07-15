namespace :db do
  desc "Populates the DB with accounts, students, enrollments, and courses"
  task populate: :environment do
    require 'populator'
    require 'faker'
    Account.populate 10 do |account|
      Course.populate 100 do |course|
        course_name = Course.where(name: 'Math 101').count > 0 ? 'Math 101' : Faker::Name.name
        course_name = course_name
        course.name = Faker::Name.name
        course.code = Faker::Number.digit
        course.start = Faker::Date.backward(23)
        course.end = Faker::Date.forward(23)
        Enrollment.populate 20 do |enrollment|
          enrollment.course_id = course.id
          student = Student.create(name: Faker::Name.name, 
                                              email: Faker::Internet.email, 
                                              about: Faker::Lorem.paragraph,
                                              gpa: Faker::Number.between(0.0, 4.0),
                                              gender: ['Male', 'Female'].sample)
          enrollment.student_id = student.id
          puts "Enrollment created for Student: #{student.name} in Course: #{course.name}"
        end
      end
    end
    puts 'Database Populated!'
  end
end
