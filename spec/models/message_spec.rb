RSpec.describe Message, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  it 'should not have error is message is valid' do
    message = FactoryGirl.create(:message)
    expect(message.errors.any?).to be_falsey
  end

  it 'should have a Body can"t be blank error if message does not have a user' do
    message = FactoryGirl.build(:message, :with_no_user)
    message.save
    expect(message.errors.full_messages.first).to eq('User must exist')
  end

  it 'should have a Body can"t be blank error is message does not have a body' do
    message = FactoryGirl.build(:message, :with_no_body)
    message.save
    expect(message.errors.full_messages.first).to eq('Body can\'t be blank')
  end

end
