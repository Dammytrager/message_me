FactoryGirl.define do

  factory :message, aliases: [:messages] do
    user
    body 'This is a message'

    trait :with_no_user do
      user nil
    end

    trait :with_no_body do
      body nil
    end
  end

  factory :user do
    username 'Joy2'
    password 'password'

    trait :with_messages do
      after(:create) do |user, evaluator|
        create_list(:message, 5, user: user)
      end
    end

    trait :with_no_username do
      username nil
    end

    trait :with_no_password do
      password nil
    end
  end
end