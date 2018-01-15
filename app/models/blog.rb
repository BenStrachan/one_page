# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Blog < ApplicationRecord
  belongs_to :business
end
