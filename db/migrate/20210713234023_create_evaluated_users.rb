class CreateEvaluatedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluated_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :evaluation, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
