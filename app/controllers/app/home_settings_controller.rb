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
    setting.assign_attributes home_settings_params
    setting.api_key = setting.api_key_was if setting.api_key.blank?
    setting.save
    redirect_to app_settings_path,
                notice: "Setting has been updated successfully"
  end

  private
  def home_settings_params
    params.require(:home_setting).permit(
      :introduction_title, :introduction_description, :business_name, :business_phone, :business_address, :careers_title,
      :careers_description, :business_email, :api_key
    )
  end
end
