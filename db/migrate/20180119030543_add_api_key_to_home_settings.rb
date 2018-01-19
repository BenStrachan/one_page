class AddApiKeyToHomeSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :home_settings, :api_key, :string
  end
end
