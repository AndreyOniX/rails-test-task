class CreateTt0413s < ActiveRecord::Migration[5.1]
  def change
    create_table 'tt-0413' do |t|
      t.string :first_name, limit: 100, null: false
      t.string :last_name, limit: 100, null: false
      t.string :email, null: false
      t.string :phone, limit: 100, null: false
      t.string :company, limit: 100, null: false
      t.string :job, limit: 100, null: false
      t.string :country, limit: 100, null: false
      t.datetime :created_at, null: false
    end
  end
end
