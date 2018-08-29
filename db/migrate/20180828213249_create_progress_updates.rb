class CreateProgressUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :progress do |t|
      t.string :name
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamp
    end
  end
end
