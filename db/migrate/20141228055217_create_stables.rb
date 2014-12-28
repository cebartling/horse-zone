class CreateStables < ActiveRecord::Migration

  def change
    create_table :stables do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: true
      t.timestamps
    end

    add_index :stables, :name, unique: true
  end

end
