class User < ActiveRecord::Base


  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]

 def self.find_first_by_auth_conditions(warden_conditions)
   conditions = warden_conditions.dup
   if login = conditions.delete(:login)
     #認証の条件式を変更する
     where(conditions).where(["username = :value", { :value => username }]).first
   else
     where(conditions).first
   end
 end
end
