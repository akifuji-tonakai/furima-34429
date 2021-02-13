# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| birthday           | date    | null: false               |
| real_first_name    | string  | null: false               |
| real_family_name   | string  | null: false               |
| first_furigana     | string  | null: false               |
| family_furigana    | string  | null: false               |

- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| introduction     | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| send_from_id     | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

- has_one :order
- belongs_to :user


## order テーブル
| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| user   | references | null: false, foreign_key: true  |
| item   | references | null: false, foreign_key: true  |

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル
| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| post_number     | string     | null:false                      |
| prefecture_id   | integer    | null:false                      |
| village_name    | string     | null:false                      |
| village_number  | string     | null:false                      |
| building_detail | string     |                                 |
| tele_number     | string     | null:false                      |
| order           | references | null: false, foreign_key: true  |

- belongs_to :order