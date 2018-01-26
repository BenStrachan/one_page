# == Schema Information
#
# Table name: home_settings
#
#  id                          :integer          not null, primary key
#  introduction_title          :string
#  introduction_description    :text
#  careers_title               :string
#  careers_description         :text
#  business_id                 :integer
#  business_name               :string
#  business_phone              :string
#  business_address            :string
#  business_email              :string
#  api_key                     :string
#  last_sync_practitioners_at  :datetime
#  last_sync_billable_items_at :datetime
#

class HomeSetting < ApplicationRecord
  belongs_to :business
end
