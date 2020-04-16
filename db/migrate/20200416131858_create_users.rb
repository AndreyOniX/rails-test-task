class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 100
      t.string :login, null: false
      t.string :password_digest, null: false
      t.timestamps
    end
    add_index :users, :login, unique: true
  end
end
