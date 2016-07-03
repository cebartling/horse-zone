class CreateTenantUserRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :tenant_user_roles do |t|

      t.timestamps
    end
  end
end
