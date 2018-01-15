class Users::InvitationsController < Devise::InvitationsController
  layout 'auth'
  private

  def invite_resource
    super do |u|
      u.skip_invitation = true
    end
  end

  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)
    resource
  end
end