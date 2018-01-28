class AddColumnToBillableItemsAndPractitioners < ActiveRecord::Migration[5.1]
  def change
    add_column :practitioners, :business_name, :string
    add_column :billable_items, :business_name, :string
  end
end
