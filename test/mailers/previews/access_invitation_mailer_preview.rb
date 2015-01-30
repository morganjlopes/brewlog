# Preview all emails at http://localhost:3000/rails/mailers/access_invitation_mailer
class AccessInvitationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/access_invitation_mailer/new_invitation
  def new_invitation
    AccessInvitationMailer.new_invitation
  end

end
