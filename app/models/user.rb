class User < ApplicationRecord
  #email as string field
  #password_digest as string

  #password and password_confirmation as string (only virtual)
  has_secure_password  

  validates :email, presence:true
  
end
