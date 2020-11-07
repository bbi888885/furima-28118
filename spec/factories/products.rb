FactoryBot.define do
  factory :product do
    item                 { 'パステルカラーのタートルネック' }
    description          { 'ラインがきれいに見えるタートルネック' }
    category_id          { 2 }
    status_id            { 2 }
    price                { 345454 }
    delivery_cost_id     { 3 }
    shipping_area_id     { 3 }
    how_many_days_id     { 3 }

    association :user 

    #テスト用のダミー画像を用意
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
  end
end
