class AddTenantsTable < ActiveRecord::Migration

  def change
    create_table :tenants do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :tenants, :name, unique: true
  end
end
