require "rails_helper"

RSpec.describe WelcomeController, :type => :controller do
  describe "GET #landing" do
    it "responds successfully with an HTTP 200 status code" do
      get :landing
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :landing
      expect(response).to render_template("landing")
    end
  end

  describe "GET landing page when loged in" do
    login_user

    it "should get landing" do
      get 'landing'
      expect(response).to be_success
    end

    it "should have a current_user" do
      expect(:current_user).to_not eq(nil)
    end
  end
end
