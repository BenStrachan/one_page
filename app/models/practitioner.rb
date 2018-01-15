# == Schema Information
#
# Table name: practitioners
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  profession          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  business_id         :integer
#  full_name           :string
#

class Practitioner < ApplicationRecord
  PROFESSIONS = [
    "Physiotherapist",
    "Podiatrist",
    "Occupational Therapist",
    "Psychologist",
    "Dietitian",
    "Exercise Physiologist",
    "Speech Therapist",
    "Social Worker",
    "Doctor",
    "Registered Nurse",
    "Enrolled Nurse",
    "Case Manager",
    "Massage Therapist",
    "Myotherapist",
    "Therapy Assistant",
    "Support Worker",
    "Acupuncturist",
    "Osteopath",
    "Chiropractor"
  ]

  belongs_to :business

  after_validation :set_full_name

  has_attached_file :avatar, styles: { medium: "450x450>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates_presence_of :first_name, :last_name, :profession
  validates :profession, inclusion: { in: PROFESSIONS }

  private
  def set_full_name
    if first_name_changed? || last_name_changed?
      self.full_name = [first_name, last_name].join(" ") 
    end
  end
end
