class RemoveCountryIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :country_id, :string
  end
end
