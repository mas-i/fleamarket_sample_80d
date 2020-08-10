class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :postal_code, :first_name_kana, :last_name_kana, :postal_code, :prefecture, :city, :address, presence: true
  validates :first_name, :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してくだい"}
  validates :first_name_kana, :last_name_kana, format: {with: /\A[ぁ-んァ-ヶー－]+\z/, message: "全角ひらがな、カタカナで入力してくだい"}
end
