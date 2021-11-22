class User < ApplicationRecord
  #email as string field
  #password_digest as string

  #password and password_confirmation as string (only virtual)
  has_secure_password  

  has_many :twitter_accounts
  has_many :tweets



  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
  
end
