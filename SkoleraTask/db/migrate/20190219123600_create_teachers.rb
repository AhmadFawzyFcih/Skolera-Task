class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.integer :user_id, :null => false
      t.text :bio, :null => true

      t.timestamps
    end
  end
end
