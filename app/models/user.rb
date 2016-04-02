class User < ActiveRecord::Base
  attr_accessible :password, :email, :name, :idFacebook, :score
  has_secure_token
  has_secure_password

  validates   :email,
              :on => :create,
              presence: true,
              uniqueness: true,
              format: {
                with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
              }

  def to_param
    email
  end

end
