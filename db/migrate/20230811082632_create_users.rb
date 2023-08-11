class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :phone, null: false

      t.timestamps
    end

    add_index :users, :phone, unique: true
  end
end
