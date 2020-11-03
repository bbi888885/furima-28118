FactoryBot.define do
  factory :user do
    lastname              {"山田"}
    firstname             {"太郎"}
    furigana_lastname     {"カタカナ"}
    furigana_firstname    {"カタカナ"}
    email                 {"kkk@email.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    nickname              {"abe"}
    birthday              { Faker::Date.birthday}
  end
end