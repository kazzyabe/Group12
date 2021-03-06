class User < ActiveRecord::Base

  has_one :quiz
  has_many :answers
  has_many :answered_quizzes, through: :answers, source: :quiz

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
     #allow login with username
     where(conditions).where(["username = :value", { :value => username }]).first
   else
     where(conditions).first
   end
 end
end
