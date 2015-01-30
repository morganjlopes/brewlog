require 'test_helper'

class AccessInvitationMailerTest < ActionMailer::TestCase
  test "new_invitation" do
    mail = AccessInvitationMailer.new_invitation
    assert_equal "New invitation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
