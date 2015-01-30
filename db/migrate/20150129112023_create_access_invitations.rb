class CreateAccessInvitations < ActiveRecord::Migration
  def change
    create_table :access_invitations do |t|
      t.integer  :accessable_id
      t.string   :accessable_type
      t.integer  :sender_id
      t.integer  :receiver_id
      t.string   :invitation_email
      t.text     :invitation_body
      t.string   :token
      t.datetime :expiration_dts
      t.datetime :accepted_on_dts
      t.string   :slug

      t.timestamps null: false
    end
  end
end
