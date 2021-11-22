RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  it "should create a user with no errors" do
    expect(user.errors.any?).to be_falsey
  end

  it "should not create a duplicate user with same username" do
    new_user = user.dup
    new_user.save
    expect(new_user.errors.full_messages.first).to eq('Username has already been taken')
  end

  it "should not create user without username or password" do
    no_username = FactoryGirl.build(:user, :with_no_username)
    no_password = FactoryGirl.build(:user, :with_no_password)
    no_username.save
    no_password.save
    expect(no_username.errors.full_messages.first).to eq('Username can\'t be blank')
    expect(no_password.errors.full_messages.first).to eq('Password can\'t be blank')
  end

end
