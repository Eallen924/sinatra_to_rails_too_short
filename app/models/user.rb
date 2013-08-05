class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true 
  validate :email_valid?
  has_many :favorite_websites
  has_many :urls, :through => :favorite_websites

  has_secure_password 

  def email_valid?
    if email.present? && email !~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
      errors.add(:email, "Email is invalid")
    end
  end
end
