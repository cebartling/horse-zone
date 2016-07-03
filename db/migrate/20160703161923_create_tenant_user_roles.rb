class CreateTenantUserRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :tenant_user_roles do |t|
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_reference :tenant_user_roles, :tenants, foreign_key: true
    add_reference :tenant_user_roles, :users, foreign_key: true
    add_reference :tenant_user_roles, :roles, foreign_key: true
  end
end
