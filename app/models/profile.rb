class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  validates :fullname, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :province, :presence => true
  validates :postal_code, :presence => true
end
