class CreateHomeSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :home_settings do |t|
      t.string :introduction_title
      t.text :introduction_description
      t.string :careers_title
      t.text :careers_description

      t.integer :business_id, index: true
    end
  end
end
