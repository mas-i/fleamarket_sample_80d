FactoryBot.define do
  factory :address do
    first_name        {"阿部"}
    last_name         {"義人"}
    first_name_kana   {"あべ"}
    last_name_kana    {"よしと"}
    postal_code       {"123-4567"}
    prefecture        {"神奈川県"}
    city              {"相模原市"}
    address           {"3-3-3"}
  end
end


    # name { ForgeryJa(:name).full_name }
    # name_kana { ForgeryJa(:name).full_name(to: ForgeryJa::KANA) }
    # zip_code { Faker::Number.number(digits: 7).to_s }
    # code { Faker::Lorem.characters(number: 20) }
    # sex { Faker::Number.between(from: 0, to: 2) }
    # birthday { Faker::Date.birthday(min_age: 18, max_age: 65) 
    # phone { Faker::Number.number(digits: Faker::Number.between(from: 10, to: 11)) }
    # email { ForgeryJa('email').address }
    # address {Faker::Address.city,}
#   end
# end

# FactoryBot.define do
#   factory :some_model do
#     name { ForgeryJa(:name).full_name }
#     name_kana { ForgeryJa(:name).full_name(to: ForgeryJa::KANA) }
#     zip_code { Faker::Number.number(digits: 7).to_s }
#     code { Faker::Lorem.characters(number: 20) }
#     sex { Faker::Number.between(from: 0, to: 2) }
#     birthday { Faker::Date.birthday(min_age: 18, max_age: 65) 
#     phone { Faker::Number.number(digits: Faker::Number.between(from: 10, to: 11)) }
#     email { ForgeryJa('email').address }
#   end
# end