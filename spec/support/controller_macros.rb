module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in User.create(:admin)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create(username: 'test', email: 'test@sfu.ca', password: 'testtest', password_confirmation: 'testtest')
      sign_in :user, user
    end
  end
end
