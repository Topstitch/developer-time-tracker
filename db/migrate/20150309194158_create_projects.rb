class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :max_hours
      t.string :name

      t.timestamps null: false
    end
  end
end
