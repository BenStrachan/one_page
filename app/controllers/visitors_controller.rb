class VisitorsController < ApplicationController
  layout "visitors"

  def index
    @setting = HomeSetting.first
  end

  def price
    @setting = HomeSetting.first
  end


end
