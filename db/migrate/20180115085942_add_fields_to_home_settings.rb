class AddFieldsToHomeSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :home_settings, :business_name, :string
    add_column :home_settings, :business_phone, :string
    add_column :home_settings, :business_address, :string
  end
end
