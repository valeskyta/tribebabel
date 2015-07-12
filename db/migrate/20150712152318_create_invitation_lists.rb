class CreateInvitationLists < ActiveRecord::Migration
  def change
    create_table :invitation_lists do |t|
      t.integer :event_id
      t.integer :status
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
