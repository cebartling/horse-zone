class CreateInstructors < ActiveRecord::Migration

  def change
    create_table :instructors do |t|
      t.belongs_to :stable, index: true
      t.belongs_to :user, index: true
      t.boolean :active, null: false, default: true
      t.timestamps
    end

    add_foreign_key :instructors, :stables
    add_foreign_key :instructors, :users
  end

end
