class CreateBillableItems < ActiveRecord::Migration[5.1]
  def change
    create_table :billable_items do |t|
      t.string :name
      t.string :item_number
      t.integer :price

      t.timestamps
    end
  end
end
