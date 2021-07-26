class SetSelfJoinInProjectsModel < ActiveRecord::Migration[6.1]
  def change
    change_table :projects do |t|
      t.references :parent, foreign_key: { to_table: :projects }
    end

  end
end
