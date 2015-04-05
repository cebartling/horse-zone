class AddUsersTenantsTable < ActiveRecord::Migration
  def change
    create_table :users_tenants, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :tenant, index: true
    end
  end
end
