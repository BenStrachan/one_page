# == Schema Information
#
# Table name: home_settings
#
#  id                       :integer          not null, primary key
#  introduction_title       :string
#  introduction_description :text
#  careers_title            :string
#  careers_description      :text
#  business_id              :integer
#  business_name            :string
#  business_phone           :string
#  business_address         :string
#  business_email           :string
#

class HomeSetting < ApplicationRecord
end
