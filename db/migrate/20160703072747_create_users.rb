class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 30
      t.string :last_name, null: false, limit: 40
      t.string :email_address, null: false, limit: 200

      t.timestamps
    end
  end
end
