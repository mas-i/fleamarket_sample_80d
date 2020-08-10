# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## usersテーブルいが

|Column|Type|Options|
|------|----|-------|
|nick_name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|birth_day|date|null: false|

### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_one :addresses
- has_one :credit_card

## Image_itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|brand|references|foreign_key: true|
|name|string|null: false, index: true|
|price|integer|null: false|
|explain|text|null: false|
|status|string|null: false|
|postage|integer|null: false|
|prefecture|string|null: false|
|shipping_date|string|null: false|
### Association
- has_many :likes
- has_many :comments
- has_many :images
- belongs_to :user
- belongs_to :category
- belongs_to :brand

## Commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|comment|text|null: false|
### Association
- belongs_to :user
- belongs_to :item

## Categoriesテーブル]

|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|ancestry|string| |
### Association
- has_many :items

## Likesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## Credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|card_company|string	null: false|
|card_number|string|null: false|
|card_year|integer|null: false|
|card_month|integer|null: false|
|card_pass|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_no|string| |
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment|string| |
### Association
- belongs_to :user

## Imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key:true|
|image|string|null: false|
### Association
- belongs_to :item

## Brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

* ...
test
