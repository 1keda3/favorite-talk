FactoryBot.define do
  factory :user do
    nickname              { '田中'}
    email                 { Faker::Internet.unique.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    encrypted_password    { password }
    profile               { 'ふぁくとりー'}
  end
end