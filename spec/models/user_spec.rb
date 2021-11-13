RSpec.describe User, type: :model do

  let(:user) { User.create(username: 'Joyline', password: 'password') }

  it "should create a user with no errors" do
    expect(user.errors.any?).to be_falsey
  end

  it "should not create a duplicate user with same username" do
    new_user = User.create(username: 'Joyline', password: 'password')
    expect(new_user.errors.full_messages.first).to eq('Username has already been taken')
  end

  it "should not create user without username or password" do
    no_username = User.create(password: 'password')
    no_password = User.create(username: 'Joyous')
    expect(no_username.errors.full_messages.first).to eq('Username can\'t be blank')
    expect(no_password.errors.full_messages.first).to eq('Password can\'t be blank')
  end

end
