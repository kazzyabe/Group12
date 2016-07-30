class User < ActiveRecord::Base


  geocoded_by :current_sign_in_ip,
    :latitude => :lat, :longitude => :lon, :user_address => :lastlocation
  after_validation :geocode
  #reverse_geocoded_by :lat, :lon,
  #  :address => :lastlocation
  #after_validation :reverse_geocode

  has_one :quiz

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
