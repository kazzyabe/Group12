class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, uniqueness: true

  def admin?
    self.role == 'admin'
  end
end
