FactoryGirl.define do
  factory :user do
    email 'xx@xx.com'
    password 'wiggle12'
    password_confirmation 'wiggle12'

    factory :olive do
      email 'olive@xx.com'
    end
  end
end