class PractitionersController < ApplicationController
  layout 'sub_page'
  before_action :set_practitioner, only: [:show]

  def show
    @setting = HomeSetting.first
  end

  private
  def set_practitioner
    @practitioner = Practitioner.find params[:id]
  end
end
