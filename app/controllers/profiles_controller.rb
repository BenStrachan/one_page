class ProfilesController < ApplicationController
  layout 'sub_page'
  def one
    @setting = HomeSetting.first
  end
end
