FactoryBot.define do
  factory :user do
    lastname              { '山田' }
    firstname             { '太郎' }
    furigana_lastname     { 'カタカナ' }
    furigana_firstname    { 'カタカナ' }
    email                 {Faker::Internet.free_email}
    password              { 'zxc123' }
    password_confirmation { 'zxc123' }
    nickname              { 'abe' }
    birthday              { Faker::Date.birthday }
  end
end
