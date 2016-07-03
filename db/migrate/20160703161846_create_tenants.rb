class CreateTenants < ActiveRecord::Migration[5.0]
  def change
    create_table :tenants do |t|
      t.string :name, null: false, limit: 400
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
