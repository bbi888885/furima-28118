FactoryBot.define do
  factory :delivery_record do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code       { '123-4567' }
    prefecture_id     { 1 }
    city              { '東京都' }
    banchi            { '1-1' }
    building_name     { '東京ハイツ' }
    tel               { '07041020503' }
  end
end
