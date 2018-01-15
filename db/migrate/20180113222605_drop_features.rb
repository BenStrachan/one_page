class DropFeatures < ActiveRecord::Migration[5.1]
  def change
    drop_table :features
  end
end
