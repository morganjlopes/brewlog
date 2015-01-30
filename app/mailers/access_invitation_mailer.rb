class AccessInvitationMailer < ApplicationMailer
  def new_invitation(invitation_id)
    @invite = AccessInvitation.find(invitation_id)
    @body = @invite.invitation_body

    mail to: @invite.invitation_email, from: @invite.sender.email
  end
end
