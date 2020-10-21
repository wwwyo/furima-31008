# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| nick_name       | string  | null: false |
| last_name       | string  | nill: false |
| first_name      | string  | null: false |
| last_name_kana  | strung  | null: false |
| first_name_kana | string  | null: false |
| birth_year_id   | integer | nill: false |
| birth_date_id   | integer | null: false |


### Association

- has_many :items
- has_many :orders
- belongs_to_active_hash :user_birth

## items テーブル

| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| image           | ActiveStorage | null: false                    |
| title           | string        | null: false                    |
| text            | text          | null: false                    |
| genre_id        | integer       | null: false                    |
| state_id        | integer       | null: false                    |
| shipping_fee_id | integer       | null: false                    |
| prefecture_id   | integer       | null: false                    |
| days_id         | integer       | null: false                    |    
| price           | integer       | null: false                    |
| user_id         | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :item_detail

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| price   | integer    | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- attr_accessor :token
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| postal_code            | string     | null: false                   |
| delivery_prefecture_id | integer    | null: false                   |
| delivery_town          | string     | null: false                   |
| delivery_number        | string     | null: false                   |
| delivery_building      | string     |                               |
| phon_number            | integer    | null: false                   |
| order_id               | references | null: false, foreign_key:true | 

### Association

- belongs_to :order
- belongs_to_active_hash :delivery_prefecture