class AddOwnerHealthId < ActiveRecord::Migration[5.1]
  def change
    add_column :practitioners, :owner_health_id, :integer
    add_column :billable_items, :owner_health_id, :integer
    add_column :home_settings, :last_sync_practitioners_at, :datetime
    add_column :home_settings, :last_sync_billable_items_at, :datetime
  end
end
