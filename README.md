# README

# テーブル設計

## users テーブル

| Column    | Type    | Options                   |
| --------- | ------- | ------------------------- |
| nickname  | string  | null: false, unique: true |
| email     | string  | null: false               |
| password  | string  | null: false               |
| birthday  | integer | null: false               |
| real_name | string  | null: false               |

- has_many :items
- has_many :purchases
- has_one :address


## items テーブル

| Column       | Type      | Options                                     |
| ------------ | --------- | ------------------------------------------- |
| name         | string    | null: false                                 |
| introduction | text      | null: false                                 |
| item_profile | text      | null: false                                 |
| category     | string    | null: false                                 |
| status       | string    | null: false                                 |
| price        | integer   | null: false                                 |
| user_id      | reference | reference | null: false, foreign_key: true  |

- has_one :purchase
- belongs_to :user
- has_one :address


## purchases テーブル
| Column     | Type      | Options                         |
| ---------- | --------- | ------------------------------- |
| address_id | reference | null: false, foreign_key: true  |
| user_id    | reference | null: false, foreign_key: true  |
| item_id    | reference | null: false, foreign_key: true  |

- belongs_to :user
- belongs_to :item
- belongs_to :address


## addresses テーブル
| Column  | Type      | Options                         |
| ------- | --------- | ------------------------------- |
| address | text      | null:false                      |
| user_id | reference | null: false, foreign_key: true  |
| item_id | reference | null: false, foreign_key: true  |

- belongs_to :user
- belongs_to :item
- has_one :purchase