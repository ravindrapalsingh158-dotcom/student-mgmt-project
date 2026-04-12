# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

student = Student.create(
  first_name: "ravi singh",
  last_name: "dodiya",
  email: "ravv@gamil.com"
)

15.times do |i|
  Student.create(
    first_name: "student#{i+1}",
    last_name: "last#{i+1}",
    email: "student#{i+1}@example.com",
    phone_number: "123456789#{i+1}"
  )
end

Student.all.each do |student|
  student.blogs.create(title: "Blog Title for #{student.first_name}", contant: "This is the contant of the blog for #{student.first_name}.")
  student.blogs.create(title: "Blog Title for #{student.first_name}", contant: "This is the contant of the blog for #{student.first_name}.")
end 

StudentProject.create(student_id: 1, project_id: 1, submission_date: Date.today + 7.days)