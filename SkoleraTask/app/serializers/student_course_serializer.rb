class StudentCourseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :student_id , :course_id , :grade
  belongs_to :course
end