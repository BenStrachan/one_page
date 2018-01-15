class App::DashboardsController < App::BaseController
  def index
  end

  def settings
    @setting = current_business.home_setting || current_business.build_home_setting
  end
end