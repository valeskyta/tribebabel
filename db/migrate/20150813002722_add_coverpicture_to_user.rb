class AddCoverpictureToUser < ActiveRecord::Migration
  def change
    add_column :users, :coverpicture, :string
  end
end
