require 'test_helper'

class AccessInvitationsControllerTest < ActionController::TestCase
  setup do
    @access_invitation = access_invitations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:access_invitations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create access_invitation" do
    assert_difference('AccessInvitation.count') do
      post :create, access_invitation: { accepted_on_dts: @access_invitation.accepted_on_dts, expiration_dts: @access_invitation.expiration_dts, invitation_body: @access_invitation.invitation_body, invitation_email: @access_invitation.invitation_email, owner_id: @access_invitation.owner_id, owner_type: @access_invitation.owner_type, receiver_id: @access_invitation.receiver_id, sender_id: @access_invitation.sender_id, slug: @access_invitation.slug, token: @access_invitation.token }
    end

    assert_redirected_to access_invitation_path(assigns(:access_invitation))
  end

  test "should show access_invitation" do
    get :show, id: @access_invitation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @access_invitation
    assert_response :success
  end

  test "should update access_invitation" do
    patch :update, id: @access_invitation, access_invitation: { accepted_on_dts: @access_invitation.accepted_on_dts, expiration_dts: @access_invitation.expiration_dts, invitation_body: @access_invitation.invitation_body, invitation_email: @access_invitation.invitation_email, owner_id: @access_invitation.owner_id, owner_type: @access_invitation.owner_type, receiver_id: @access_invitation.receiver_id, sender_id: @access_invitation.sender_id, slug: @access_invitation.slug, token: @access_invitation.token }
    assert_redirected_to access_invitation_path(assigns(:access_invitation))
  end

  test "should destroy access_invitation" do
    assert_difference('AccessInvitation.count', -1) do
      delete :destroy, id: @access_invitation
    end

    assert_redirected_to access_invitations_path
  end
end
