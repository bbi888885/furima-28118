require 'rails_helper'
describe Product do
  before do
    @product = FactoryBot.build(:product)
    @user = FactoryBot.build(:user)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'item, description, category_id, status_id, price,
      delivery_cost_id, shipping_area_id, how_many_day_idとimageが存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '商品出品がうまくいくとき' do
      it "画像は1枚必須であること" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が必須であること" do
        @product.item = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Item can't be blank")
      end
      it "商品説明が必須であること" do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーの情報が必須であること" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can not be blank")
      end
      it "商品の状態についての情報が必須であること" do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can not be blank")
      end
      it "配送料の負担についての情報が必須であること" do
        @product.delivery_cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery cost can not be blank")
      end
      it "発送元の地域についての情報が必須であること" do
        @product.shipping_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area can not be blank")
      end
      it "発送までの日数についての情報が必須であること" do
        @product.how_many_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("How many day can not be blank")
      end
      it "価格についての情報が必須であること" do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
      it "価格が299円以下の場合は登録できない" do
        @product.price = 99
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が10,000,000以上の場合は登録できない" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      
      it "販売価格は半角数字のみ保存可能であること" do
        @product.price = "aaa"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end

