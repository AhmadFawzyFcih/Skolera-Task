class CourseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description , :number_of_hours , :semester , :grade
  # has_many :students , through: :student_courses
end
