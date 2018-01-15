class VisitorsController < ApplicationController
  layout "visitors"

  def index
    @setting = HomeSetting.first
  end
end
