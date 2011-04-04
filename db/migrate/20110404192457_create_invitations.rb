class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.integer :user_id # author/creator
      t.string :recipient_email
      t.string :subject
      t.text :content
      t.string :state, :default => 'new'
      t.string :token
      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
