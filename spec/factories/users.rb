FactoryGirl.define do
  factory :user, class: User do
    username "test"
    email "test@sfu.ca"
    password "testtest"
    password_confirmation "testtest"
  end

  factory :admin, class: User do
    username "Admin"
    email "admin@sfu.ca"
    password "adminadmin"
    password_confirmation "adminadmin"
    role      "admin"
  end
end
