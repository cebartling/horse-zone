class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.boolean :active, null: false, default: true
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end

    add_reference :schedules, :tenants, foreign_key: true, index: true
  end
end
