class AccessInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_brewery_from_url
  before_action :load_accessable
  before_action :set_access_invitation, only: [:show, :edit, :update, :destroy, :authorize]

  def create
    @access_invitation = @accessable.access_invitations.new(access_invitation_params)
    @access_invitation.sender = current_user

    if @access_invitation.parse_and_send_invitations(params)
      redirect_to brewery_members_path(@brewery), notice: 'Invitations were sent.'
    else
      redirect_to brewery_members_path(@brewery), notice: 'There seems to be an issue sending your invitations.'
    end
  end

  def destroy
    @access_invitation.destroy
  end

  def authorize
    # Require token to limit brute force
    raise "Invalid security token" unless params[:t] == @access_invitation.token


    if @access_invitation.accepted_on_dts.present? # Make sure invitation isn't already accepted
      redirect_to root_path, notice: "This Invitation has already been accepted."
    elsif @access_invitation.expiration_dts > Time.now # Make sure invitation isn't expired
      redirect_to brewery_path(@access_invitation.accessable), notice: "This Invitation has expired."
    else
      @access_invitation.accessable.users << current_user
      @access_invitation.accepted_on_dts  = Time.now
      @access_invitation.receiver         = current_user

      if @access_invitation.save
        redirect_to brewery_path(@access_invitation.accessable), notice: "Welcome to #{@access_invitation.accessable.name}!"
      end
    end

    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: "Sorry, it appears your invitation has been revoked."
  end

  private
    def set_brewery_from_url
      @brewery = Brewery.find(params[:brewery_id])
    end

    def load_accessable
      resource, id = request.path.split('/')[1, 2]
      @accessable = resource.singularize.classify.constantize.find(id)
    end

    def set_access_invitation
      @access_invitation = AccessInvitation.find(params[:id])
    end

    def access_invitation_params
      params.require(:access_invitation).permit(:invitation_email,
                                                :invitation_body,
                                                :comma_seperated_emails)
    end
end
