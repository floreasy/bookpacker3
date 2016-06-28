FactoryGirl.define do
  factory :user_token do
    user nil
    token "MyString"
    installation_identifier "MyString"
    push_token "MyString"
    locked false
    form_factor "MyString"
    os "MyString"
  end
end
