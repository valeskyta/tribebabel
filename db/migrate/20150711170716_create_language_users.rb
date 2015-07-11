class CreateLanguageUsers < ActiveRecord::Migration
  def change
    create_table :language_users do |t|
      t.integer :language_id
      t.integer :user_id
      t.integer :level

      t.timestamps null: false
    end
  end
end
