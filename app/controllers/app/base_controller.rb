class App::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  helper_method :current_business

  def current_business
    @current_business ||= current_user.business
  end
end