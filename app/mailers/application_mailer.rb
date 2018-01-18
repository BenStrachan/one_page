class ApplicationMailer < ActionMailer::Base
  append_view_path Rails.root.join('app', 'views', 'mailers')
  default from: 'noreply@gmail.com'
  layout 'mailer'

  def contact_mailer(setting, data)
    @data = data
    @setting = setting
    mail(to: setting.business_email, subject: "New Contact")
  end
end
