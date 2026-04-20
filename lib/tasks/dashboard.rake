namespace :dashboard do
  desc "Count all ActiveRecord records"

  task count_all_records: :environment do
    puts "Students: #{Student.count}"
    puts "Courses: #{Course.count}"
    puts "Blogs: #{Blog.count}"
  end
end