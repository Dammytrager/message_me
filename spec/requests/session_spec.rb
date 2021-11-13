RSpec.describe "Sessions", type: :request do
  let(:user) { User.create(username: 'Joy', password: 'password') }

  describe "GET /login" do

    it "should allow guests" do
      get login_path
      expect(response.status).to be(200)
    end

    it "should redirect logged in users" do
      sign_in_as(user)
      get login_path
      expect(response.status).to be(302)
    end
  end

  describe "POST /login" do
    let(:wrong_user) { {username: 'Joyous', password: 'password'} }
    let(:right_user) { {username: 'Joy', password: 'password'} }

    it "should allow guests with correct credentials" do
      post login_path, params: {session: right_user}
      # Go to home page when a guest with correct credentials logs in
      expect(response.status).to be(302)
    end

    it "should prevent guests with wrong credentials" do
      post login_path, params: {session: wrong_user}

      # Render the same login view when the wrong user tries to sign in
      expect(response.status).to be(200)

      # Show Wrong credentials message on login screen
      expect(response.body).to match('credentials')

    end

  end

  describe "DELETE /logout" do

    it "should log user out and go to the login page" do
      delete logout_path
      # Go to home page when a guest with correct credentials logs in
      expect(response.status).to be(302)

      follow_redirect!
      # Should show the login page
      expect(response.body).to match('login')
    end

  end
end
