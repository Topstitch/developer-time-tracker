class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.decimal :duration, :precision => 8, :scale => 2
      t.date :worked_on
      t.integer :project_id, index: true
      t.integer :developer_id, index: true

      t.timestamps null: false
    end
  end
end
