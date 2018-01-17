# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :string
#  content            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Blog < ApplicationRecord
  has_attached_file :photo, styles: { medium: "450x450>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
