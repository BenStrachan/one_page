class AddFieldsToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :address, :string
    add_column :businesses, :facebook, :string
    add_column :businesses, :twitter, :string
    add_column :businesses, :linkedin, :string
  end
end
