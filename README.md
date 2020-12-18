# テーブル設計

## users テーブル

| Column   | Type    | Option      |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column    | Type       | Option                         | 
| --------- | ---------- | ------------------------------ |
| item_name | string     | null: false                    |
| nickname  | references | null: false ,foreign_key: true |
| price     | integer    | null: false                    |
| detail    | text       | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column       | Type       | Option                         | 
| ------------ | ---------- | ------------------------------ |
| item_name    | references | null: false, foreign_key: true |
| nickname     | references | null: false, foreign_key: true |
| phone_number | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
| Column        | Type    | Option      | 
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |


- belongs_to :purchase
