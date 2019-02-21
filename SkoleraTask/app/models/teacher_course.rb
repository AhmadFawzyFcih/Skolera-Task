class TeacherCourse < ApplicationRecord

    validates :course_id, presence: true    
    validates :teacher_id, presence: true    

    belongs_to :teacher
    belongs_to :course
    
end
