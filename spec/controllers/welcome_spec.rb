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
end
