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
- has_many :chats


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
- has_many :chats


## orders テーブル
| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| user   | references | null: false, foreign_key: true  |
| item   | references | null: false, foreign_key: true  |

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null:false                     |
| send_from_id    | integer    | null:false                     |
| village_name    | string     | null:false                     |
| village_number  | string     | null:false                     |
| building_detail | string     |                                |
| tele_number     | string     | null:false                     |
| order           | references | null: false, foreign_key: true |

- belongs_to :order


## chats テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| ex_price  | string     |                                |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user

# chat_roomsテーブルを削除する方針で起こりそうな弊害
chat_roomsと中間テーブルのchat_room_usersを消した場合のmessagesテーブルを想像してみる
メッセージはメッセージ保存の機能は有するが、部屋を作る機能は有しない
特定の部屋に登録された二人のみが入れるという権限が、長く記述されることが予想される
単一責任の原則から、メッセージ機能はメッセージを保存するテーブルで、ルームはメッセージとルームを管理する機能とするべきではある。