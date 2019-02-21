class TeacherCourseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :teacher_id , :course_id
  belongs_to :course
end