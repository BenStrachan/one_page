class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :heading
      t.string :paragraph

      t.timestamps
    end
  end
end
