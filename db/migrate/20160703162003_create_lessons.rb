class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.boolean :active, null: false, default: true
      t.timestamp :start_time, null: false
      t.timestamp :end_time, null: false

      t.timestamps
    end

    add_reference :lessons, :schedules, foreign_key: true
    add_reference :lessons, :tenant_user_roles, foreign_key: true, column: :instructor_id, index: true
  end
end
