class AddEmailToHomeSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :home_settings, :business_email, :string
  end
end
