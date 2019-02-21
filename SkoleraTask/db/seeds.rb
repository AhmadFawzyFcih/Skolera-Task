# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
StudentCourse.destroy_all
TeacherCourse.destroy_all
Student.destroy_all
Teacher.destroy_all
Course.destroy_all
User.destroy_all
JWTBlacklist.destroy_all

student = User.create({ name: "Ahmed Fawzy" , email: "student@gmail.com" , password: 123456 , user_type: 1 })
          Student.create({user_id: student.id , age: 24 , level: 3 })
teacher = User.create({ name: "Mohamed Ahmed" , email: "teacher@gmail.com" , password: 123456 , user_type: 2 })
          Teacher.create({user_id: teacher.id , bio: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here,"})
admin   = User.create({ name: "Ahmed Emam" , email: "admin@gmail.com" , password: 123456 , user_type: 1001 })

(1..10).each do |num|
    Course.create({ name: "course #{num}" })
end


p "Created #{User.count} users"
p "Created #{Course.count} courses"