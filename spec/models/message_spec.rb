RSpec.describe Message, type: :model do

  let(:user) { User.create(username: 'Joy', password: 'password') }

  it 'should not have error is message is valid' do
    message = Message.create(body: 'Hello', user: user)
    expect(message.errors.any?).to be_falsey
  end

  it 'should have a Body can"t be blank error is message does not have a user' do
    message = Message.create(body: 'Hello')
    expect(message.errors.full_messages.first).to eq('User must exist')
  end

  it 'should have a Body can"t be blank error is message does not have a body' do
    message = Message.create(user: user)
    expect(message.errors.full_messages.first).to eq('Body can\'t be blank')
  end

end
