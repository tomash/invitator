class AddAcceptorIdToInvitations < ActiveRecord::Migration
  def self.up
    add_column :invitations, :acceptor_id, :integer
  end

  def self.down
    remove_column :invitations, :acceptor_id
  end
end
