class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :password, :password_confirmation, :remember_me
  
  has_one :profile
  
  validates_presence_of :login
  validates_uniqueness_of :login
  validates_format_of :login, :with => /^[\w]+$/, :message => "alphanumeric only"
  validates_length_of :login, :maximum => 50
  
  validates_presence_of :password
  validates_confirmation_of :password
  validates_length_of :password, :within => 3..50
  
  after_create :create_empty_profile
  
  def create_stub_profile
    p = Profile.new(:user => self)
    p.save(false)
  end
  
end
