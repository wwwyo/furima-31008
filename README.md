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
| birth_day       | date    | null: false |


### Association

- has_many :items
- has_many :orders

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
| user            | references    | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

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
| phon_number            | string     | null: false                   |
| order                  | references | null: false, foreign_key:true | 

### Association

- belongs_to :order