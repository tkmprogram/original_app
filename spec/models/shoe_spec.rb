require 'rails_helper'

RSpec.describe Shoe, type: :model do
  before do
    @shoe = FactoryBot.build(:shoe)
  end

  describe '投稿' do
    context '投稿できる時' do
      it '全ての空欄が埋まっていれば投稿できる' do
        expect(@shoe).to be_valid
      end
    end
    context '投稿できない時' do
      it 'imageが空だと投稿できない' do
        @shoe.image = nil
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空だと投稿できない' do
        @shoe.title = ''
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationが空だと投稿できない' do
        @shoe.explanation = ''
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'manufacture_idが空だと登録できない' do
        @shoe.manufacturer_id = ''
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("Manufacturer is not a number")
      end
      it 'color_idが空だと登録できない' do
        @shoe.color_id = ''
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("Color is not a number")
      end
      it 'inout_idが空だと登録できない' do
        @shoe.inout_id = ''
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("Inout is not a number")
      end
      it 'manufacture_idが1では登録できない' do
        @shoe.manufacturer_id = '1'
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("Manufacturer must be other than 1")
      end
      it 'color_idが1では登録できない' do
        @shoe.color_id = '1'
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("Color must be other than 1")
      end
      it 'inout_idが1では登録できない' do
        @shoe.inout_id = '1'
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("Inout must be other than 1")
      end
      it 'uesrが紐付いていなければ登録できない' do
        @shoe.user = nil
        @shoe.valid?
        expect(@shoe.errors.full_messages).to include("User must exist")
      end
    end
  end

end

