require 'rails_helper'
  describe Address do
    describe '#create' do
      it "first_nameとlast_name、first_name_kanaとlast_name_kana、postal_code、prefecture、city、addressが存在すれば登録できること" do
        user = build(:address)
        expect(user).to be_valid
      end

      it "first_nameが空では登録できないこと" do
        address = build(:address, first_name: nil)
        address.valid?
        expect(address.errors[:first_name]).to include("を入力してください")
      end

      it "first_nameが全角以外では登録できないこと" do
        address = build(:address, first_name: nil)
        address.valid?
        expect(address.errors[:first_name]).to include("全角で入力してくだい")
      end

      it "last_nameが空では登録できないこと" do
        address = build(:address, last_name: nil)
        address.valid?
        expect(address.errors[:last_name]).to include("を入力してください")
      end
  
      it "last_nameが全角以外では登録できないこと" do
        address = build(:address, last_name: nil)
        address.valid?
        expect(address.errors[:last_name]).to include("全角で入力してくだい")
      end

      it "first_name_kanaが空では登録できないこと" do
        address = build(:address, first_name_kana: nil)
        address.valid?
        expect(address.errors[:first_name_kana]).to include("を入力してください")
      end

      it "first_name_kanaが全角以外では登録できないこと" do
        address = build(:address, first_name_kana: nil)
        address.valid?
        expect(address.errors[:first_name_kana]).to include("全角ひらがな、カタカナで入力してくだい")
      end
      it "last_name_kanaが空では登録できないこと" do
        address = build(:address, last_name_kana: nil)
        address.valid?
        expect(address.errors[:last_name_kana]).to include("を入力してください")
      end
      it "last_name_kanaが全角以外では登録できないこと" do
        address = build(:address, last_name_kana: nil)
        address.valid?
        expect(address.errors[:last_name_kana]).to include("全角ひらがな、カタカナで入力してくだい")
      end
      it "postal_codeが空では登録できないこと" do
        address = build(:address, postal_code: nil)
        address.valid?
        expect(address.errors[:postal_code]).to include("を入力してください")
      end
      it "prefectureが空では登録できないこと" do
        address = build(:address, prefecture: nil)
        address.valid?
        expect(address.errors[:prefecture]).to include("を入力してください")
      end
      it "cityが空では登録できないこと" do
        address = build(:address, city: nil)
        address.valid?
        expect(address.errors[:city]).to include("を入力してください")
      end
      it "addressが空では登録できないこと" do
        address = build(:address, address: nil)
        address.valid?
        expect(address.errors[:address]).to include("を入力してください")
      end
    end
  end