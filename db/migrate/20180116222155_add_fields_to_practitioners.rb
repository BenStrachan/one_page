class AddFieldsToPractitioners < ActiveRecord::Migration[5.1]
  def change
    add_column :practitioners, :summary, :string
    add_column :practitioners, :registration, :string
  end
end
