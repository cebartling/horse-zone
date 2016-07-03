class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :lookup_code, null: false, limit: 30
      t.string :name, null: false, limit: 30
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
