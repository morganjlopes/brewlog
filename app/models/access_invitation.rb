class AccessInvitation < ActiveRecord::Base
  include ActionView::Helpers::UrlHelper

  belongs_to :accessable, polymorphic: true
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"

  validates_uniqueness_of :invitation_email, scope: :accessable_id
  before_create :_generate_interaction_info
  before_create :_generate_default_content

  attr_accessor :comma_seperated_emails

  def parse_and_send_invitations(params)
    params[:access_invitation][:comma_seperated_emails].gsub(" ", "").split(',').each do |invitee|
      individual_invite = self.dup
      individual_invite.invitation_email = invitee
      if individual_invite.save
        AccessInvitationMailer.new_invitation(individual_invite.id).deliver
      end
    end
  end

  def default_body_copy
    if self.accessable_type == "Brewery"
      "Join Our Brewery!\n\nI'd like to invite you to become a member of my brewery.\n\nCome signin, and together we'll be able to track batches we brew, record tasting feedback, and create recipes."
    else
      "Come brew with us! You've been invited to join as we brew a new batch."
    end
  end

  private

  def _generate_interaction_info
    self.token           = SecureRandom.urlsafe_base64 if new_record?
    self.expiration_dts  = Time.now + 4.week
  end

  def _generate_default_content
    self.invitation_body = self.default_body_copy
  end
end
