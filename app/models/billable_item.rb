# == Schema Information
#
# Table name: billable_items
#
#  id                     :integer          not null, primary key
#  name                   :string
#  item_number            :string
#  price                  :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  business_id            :integer
#  practitioner_full_name :string
#

class BillableItem < ApplicationRecord
  belongs_to :business

  validates_presence_of :name, :item_number, :price

  validates :price, numericality: { greater_than: 0 }
end
