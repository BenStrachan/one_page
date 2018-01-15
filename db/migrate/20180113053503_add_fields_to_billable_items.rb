class AddFieldsToBillableItems < ActiveRecord::Migration[5.1]
  def change
    add_column :billable_items, :business_name, :string
    add_column :billable_items, :practitioner_full_name, :string
  end
end
