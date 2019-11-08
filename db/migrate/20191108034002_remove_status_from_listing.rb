class RemoveStatusFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :status, :integer
  end
end
