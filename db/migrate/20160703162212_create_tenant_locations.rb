class CreateTenantLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :tenant_locations do |t|
      t.string :address1, null: false, limit: 255
      t.string :address2, null: true, limit: 255
      t.string :address3, null: true, limit: 255
      t.string :city, null: false, limit: 60
      t.string :state_code, null: false, limit: 2
      t.string :zip_code, null: false, limit: 9
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_reference :tenant_locations, :tenants, foreign_key: true, index: true
  end
end
