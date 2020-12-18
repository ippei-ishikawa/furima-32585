# テーブル設計

## users テーブル

| Column             | Type    | Option      |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| name               | string  | null: false |
| kana_name          | string  | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column     | Type       | Option                         | 
| ---------- | ---------- | ------------------------------ |
| item       | string     | null: false                    |
| user       | references | null: false ,foreign_key: true |
| price      | integer    | null: false                    |
| detail     | text       | null: false                    |
| category   | integer    | null: false                    |
| condition  | integer    | null: false                    |
| shipping   | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| days       | integer    | null: false                    |

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
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |

- belongs_to :purchase
