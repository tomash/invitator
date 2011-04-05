require 'digest/sha1'

class Invitation < ActiveRecord::Base
  belongs_to :user
  validates :recipient_email, :presence => true
  validates :token, :presence => true
  before_validation :fill_token
  before_create :split_emails
  
  private
  def fill_token
    self.token = Digest::SHA1.hexdigest(rand.to_s)
  end
  
  def split_emails
    emails = self.recipient_email.split(',').map(&:strip)
    self.recipient_email = emails.shift
    emails.each do |email|
      new_invitation = self.clone
      new_invitation.recipient_email = email
      new_invitation.save
    end
  end
end
