class AddReferencesFromUserToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :user_id, :integer
    add_foreign_key :trips, :users
  end
end
