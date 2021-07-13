class CreateCareers < ActiveRecord::Migration[6.1]
  def change
    create_table :careers do |t|
      t.string :name
      t.references :faculty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
