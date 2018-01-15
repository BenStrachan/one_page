class ModifyPractitioners < ActiveRecord::Migration[5.1]
  def up
    add_attachment :practitioners, :avatar
    add_column :practitioners, :business_id, :integer
    add_column :practitioners, :full_name, :string
  end

  def down
    remove_attachment :practitioners, :avatar
    remove_column :practitioners, :business_id, :integer
    remove_column :practitioners, :full_name, :string
  end
end
