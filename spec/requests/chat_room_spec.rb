RSpec.describe "ChatRooms", type: :request do
  describe "GET /index" do

    let(:user) { FactoryGirl.create(:user) }

    it "Should return status 302 when not logged in" do
      get root_path
      expect(response.status).to eq(302)
      follow_redirect!
      expect(response.body).to match('Login')
    end

    it "should return 200 when user is logged in" do
      sign_in_as(user)
      get root_path
      expect(response.status).to eq(200)
    end

  end
end
