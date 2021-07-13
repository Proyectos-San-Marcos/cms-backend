class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.string :name
      t.string :link
      t.date :released_at
      t.date :finished_at

      t.timestamps
    end
  end
end
