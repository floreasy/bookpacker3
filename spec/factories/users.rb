# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    email
    password '12345678'
    password_confirmation '12345678'
  end
end
FactoryGirl.define do
  factory :user_with_token, parent: :user do
    after :build do |user, evaluator|
      user.user_tokens.build installation_identifier: Faker::Lorem.characters(10), push_token: Faker::Lorem.characters(10),
                             form_factor: %w(smartphone tablet10 tablet7 desktop).sample, os: %w(ios android bb wp7).sample
    end
  end
end