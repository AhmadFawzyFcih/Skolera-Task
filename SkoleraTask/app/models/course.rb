class Course < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false } , length: {maximum: 50}
    
    has_many :student_courses
    has_many :students , through: :student_courses
    has_many :teacher_courses
    has_many :teachers , through: :teacher_courses    
end
