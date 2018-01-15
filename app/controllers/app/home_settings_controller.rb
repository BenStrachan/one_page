class App::HomeSettingsController < App::BaseController

  def create
    setting = current_business.build_home_setting
    setting.assign_attributes home_settings_params
    setting.save

    redirect_to app_settings_path,
                notice: "Setting has been updated successfully"
  end

  def update
    setting = current_business.home_setting
    setting.update home_settings_params
    redirect_to app_settings_path,
                notice: "Setting has been updated successfully"
  end

  private
  def home_settings_params
    params.require(:home_setting).permit(
      :introduction_title, :introduction_description, :careers_title,
      :careers_description
    )
  end
end