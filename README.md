# テーブル設計

## users テーブル

| Column    | Type   | Options                   |
| --------  | ------ | ------------------------- |
| nickname  | string | null: false               |
| email     | string | null: false, unique: true |
| password  | string | null: false               |
| first_name| string | null: false               |
| last_name | string | null: false               |
| birthday  | date   | null: false               |
### Association

- has_many : goods
- has_one  : streets

## goods テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| product_name| string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null :false                    |
| delivery_fee| string     | null :false                    |
| price       |            | null :false                    | 
| user        | references | null: false, foreign_key: true |
| image       |            | ActiveStarage                  |

### Association

- belongs_to :user

## streets テーブル

| Column | Type          | Options                        |
| ------ | ------------- | ------------------------------ |
| postal_code   | string | null: false, foreign_key: true |
| pretectures   | string | null: false, foreign_key: true |
| municipality  | string | null: false                    |
| address       | string | null: false                    |
| building      | string | null: false                    |

### Association

- belongs_to :user


