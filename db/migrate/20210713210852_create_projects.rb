class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :resume
      t.date :released_at
      t.date :finished_at

      t.timestamps
    end
  end
end
