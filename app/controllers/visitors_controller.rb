class VisitorsController < ApplicationController
  layout "visitors", only: [:index]
  layout 'sub_page', only: [:contacts_success]

  def index
    @setting = HomeSetting.first
  end


  def contacts
    @setting = HomeSetting.first
    ApplicationMailer.contact_mailer(@setting, params).deliver_now
    redirect_to contacts_success_path
  end

  def contacts_success
    @setting = HomeSetting.first
  end

end
