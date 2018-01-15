class ModifyBillableItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :billable_items, :practitioner_full_name
    remove_column :billable_items, :business_name

    add_column :billable_items, :business_id, :integer
    add_index :billable_items, :business_id
  end
end
