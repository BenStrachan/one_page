class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.string :heading
      t.string :paragraph

      t.timestamps
    end
  end
end
