class FixupUsers < ActiveRecord::Migration

  def change
    remove_column :users, :encrypted_password

    add_column :users, :password_digest, :string, null: false, limit: 100
    add_column :users, :first_name, :string, null: true, limit: 30
    add_column :users, :last_name, :string, null: true, limit: 40
  end

end
