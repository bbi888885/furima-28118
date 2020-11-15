require 'rails_helper'

RSpec.describe DeliveryRecord, type: :model do
  describe '購入情報の保存' do
    before do
      @delivery_record = FactoryBot.build(:delivery_record)
    end
    it "tokenが空では登録できないこと" do
      @delivery_record.token = nil
      @delivery_record.valid?
      expect(@delivery_record.errors.full_messages).to include("Token can't be blank")
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@delivery_record).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @delivery_record.postal_code = nil
      @delivery_record.valid?
      expect(@delivery_record.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @delivery_record.postal_code = '1234567'
      @delivery_record.valid?
      expect(@delivery_record.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @delivery_record.prefecture_id = 0
      @delivery_record.valid?
      expect(@delivery_record.errors.full_messages).to include("Prefecture can not be blank")
    end
    it 'cityが空だと保存できないこと' do
      @delivery_record.city = nil
      @delivery_record.valid?
      expect(@delivery_record.errors.full_messages).to include("City can't be blank")
    end
    it 'banchiが空だと保存できないこと' do
      @delivery_record.banchi = nil
      @delivery_record.valid?
      expect(@delivery_record.errors.full_messages).to include("Banchi can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @delivery_record.building_name = nil
      expect(@delivery_record).to be_valid
    end
    it 'teliが空だと保存できないこと' do
      @delivery_record.tel = nil
      @delivery_record.valid?
      expect(@delivery_record.errors.full_messages).to include("Tel can't be blank")
    end
    it 'teliが半角のハイフンを含んだ場合は保存できないこと' do
      @delivery_record.tel = '123-456-789'
      @delivery_record.valid?
      expect(@delivery_record.errors.full_messages).to include("Tel is invalid")
    end
    it 'teliが11桁以上入力する場合は保存できないこと' do
      @delivery_record.tel = "012345678910"
      @delivery_record.valid?
      expect(@delivery_record.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
    end
  end
end