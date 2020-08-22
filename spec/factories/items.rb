FactoryBot.define do

  factory :item do
    # id              {1}
    name            {"商品名"}
    explain    {"説明"}
    price           {1111}
    # brand           {}
    status  {1}
    postage  {1}
    prefecture {1}
    shipping_date {1}
    category       {FactoryBot.build(:user).id}
    trait :with_item_img do
      after(:build) { |item| item.item_imgs << build_list(:item_img, 3)}
    end
  end
end