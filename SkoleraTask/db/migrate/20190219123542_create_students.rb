class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :user_id , :null => false
      t.integer :age, :null => true , :default =>  20
      t.integer :level , :null => true , :default =>  1
      t.integer :number_of_courses , :null => true , :default =>  0

      t.timestamps
    end
    add_index("students", "user_id")
  end
end
