class AddPassionToUser < ActiveRecord::Migration
  def change
    add_column :users, :passion, :text
  end
end
