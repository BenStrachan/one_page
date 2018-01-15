class DropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :introductions
    drop_table :careers
  end
end
