# == Schema Information
#
# Table name: businesses
#
#  id         :integer          not null, primary key
#  name       :string
#  phone      :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address    :string
#  facebook   :string
#  twitter    :string
#  linkedin   :string
#

class Business < ApplicationRecord

  has_many :users
  has_one :business
  has_one :home_setting
  has_many :practitioners
  has_many :billable_items
  has_many :blogs

end
