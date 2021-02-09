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
- has_many :purchases


## items テーブル

| Column        | Type      | Options                                     |
| ------------- | --------- | ------------------------------------------- |
| name          | string    | null: false                                 |
| introduction  | text      | null: false                                 |
| category      | integer   | null: false                                 |
| status        | integer   | null: false                                 |
| shipping_fee  | integer   | null: false                                 |
| send_from     | integer   | null: false                                 |
| shipping_days | integer   | null: false                                 |
| price         | integer   | null: false                                 |
| user_id       | reference | reference | null: false, foreign_key: true  |

- has_one :purchase
- belongs_to :user


## purchases テーブル
| Column     | Type      | Options                         |
| ---------- | --------- | ------------------------------- |
| user_id    | reference | null: false, foreign_key: true  |
| item_id    | reference | null: false, foreign_key: true  |

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル
| Column          | Type      | Options                         |
| --------------- | --------- | ------------------------------- |
| post_number     | integer   | null:false                      |
| prefecture      | integer   | null:false                      |
| village_name    | string    | null:false                      |
| village_number  | string    | null:false                      |
| building_detail | string    | null:false                      |
| tele_number     | integer   | null:false                      |
| user_id         | reference | null: false, foreign_key: true  |
| item_id         | reference | null: false, foreign_key: true  |
| purchase_id     | reference | null: false, foreign_key: true  |

- belongs_to :purchase