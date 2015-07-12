class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :event_date
      t.time :hour
      t.integer :visibility

      t.timestamps null: false
    end
  end
end
