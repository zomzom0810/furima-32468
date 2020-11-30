# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |
### Association

- has_many : buys
- has_many : items

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             |references  | null: false, foreign key       |



### Association

- belongs_to :user
- has_one : buy

## streets テーブル

| Column        | Type        | Options                  |
| ------------- | ----------- | ------------------------ |
| postal_code   | string      | null: false              |
| prefecture_id | integer     | null: false              |
| municipality  | string      | null: false              |
| address       | string      | null: false              |
| building      | string      |                          |
| phone_number  | string      | null: false              |
| buy           | references  | null: false, foreign key |
### Association

- belongs_to :buy

##  buys テーブル
| Column    | Type       | Options                  |
| ----------| ---------- | ------------------------ |
| user      | references | null: false, foreign key |
| item      | references | null: false, foreign key |
     

### Association

- belongs_to :user
- belongs_to :item
- has_one :street