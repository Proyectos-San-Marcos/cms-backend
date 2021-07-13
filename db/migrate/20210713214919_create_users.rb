class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.integer :dni
      t.string :address
      t.string :email
      t.date :birthday
      t.integer :unmsm_code
      t.integer :cicle
      t.date :registered_at
      t.references :area, null: false, foreign_key: true
      t.references :career, null: false, foreign_key: true
      t.integer :role
      t.integer :status

      t.timestamps
    end
  end
end
