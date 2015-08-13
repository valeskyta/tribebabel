class AddTravelsToUser < ActiveRecord::Migration
  def change
    add_column :users, :travels, :text
  end
end
