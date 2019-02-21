class StudentCourse < ApplicationRecord

    validates :course_id, presence: true    
    validates :student_id, presence: true    

    belongs_to :student
    belongs_to :course

end
