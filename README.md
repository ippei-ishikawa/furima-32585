# テーブル設計

## users テーブル

| Column             | Type    | Option                    |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| given_name         | string  | null: false               |
| kana_family_name   | string  | null: false               |
| kana_given_name    | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column        | Type       | Option                         | 
| ------------- | ---------- | ------------------------------ |
| item          | string     | null: false                    |
| user          | references | null: false ,foreign_key: true |
| price         | integer    | null: false                    |
| detail        | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| shipping_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column | Type       | Option                         | 
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
| Column        | Type       | Option                         | 
| ------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |

- belongs_to :purchase
