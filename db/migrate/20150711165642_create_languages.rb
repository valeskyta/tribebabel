class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :description
      t.string :flag

      t.timestamps null: false
    end
  end
end
