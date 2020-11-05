FactoryBot.define do
  factory :user do
    lastname              { '山田' }
    firstname             { '太郎' }
    furigana_lastname     { 'カタカナ' }
    furigana_firstname    { 'カタカナ' }
    email                 { 'kkk@email.com' }
    password              { '0000000a' }
    password_confirmation { '0000000a' }
    nickname              { 'abe' }
    birthday              { Faker::Date.birthday }
  end
end
