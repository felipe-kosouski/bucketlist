FactoryBot.define do
  factory :user do
    name 'Felipe'
    sequence (:email) { |n| "user#{n}@bucketlist.br" }
    password 'password'
    password_confirmation 'password'
  end
end