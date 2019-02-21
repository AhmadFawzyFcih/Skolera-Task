class CreateStudentCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :student_courses do |t|
      t.integer :student_id , :null => false
      t.integer :course_id , :null => false
      t.integer :grade , :null => true , :default => 0

      t.timestamps
    end
    add_index("student_courses", "student_id")
    add_index("student_courses", "course_id")
  end
end
