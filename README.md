# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| password           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |
### Association

- has_many : buys
- has_many : items
- has_one  : streets

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| explanation      | text       | null: false                    |
| category         | string     | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| delivery_days_id | integer    | null: false                    |
| price            | string     | null: false                    | 



### Association

- belongs_to :user
- has_many : buys

## streets テーブル

| Column        | Type    | Options ou       |
| ------------- | ------- | -------------- |
| postal_code   | string  | null: false    |
| pretectures_id| integer | null: false    |
| municipality  | string  | null: false    |
| address       | string  | null: false    |
| building      | string  |                |
| phone_number  | string  | null: false    |

### Association

- belongs_to :user

##  buys テーブル
| Column        | Type       | Options                  |
| ------------- | ---------- | ------------------------ |
| user_id       | reference  | null: false, foreign key |
| item_id       | reference  | null: false, foreign key |
     

### Association

- belongs_to :user
- belongs_to :items