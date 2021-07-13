class CreateManagements < ActiveRecord::Migration[6.1]
  def change
    create_table :managements do |t|
      t.string :name

      t.timestamps
    end
  end
end
