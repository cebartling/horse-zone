class CreateTenant < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    add_index :tenants, :name, unique: true
  end
end
