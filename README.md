# テーブル設計

## users テーブル

| Column                | Type    | Options                  |
| --------------------- | ------- | ------------------------ |
| nickname              | string  | null: false              |
| email                 | string  | null: false, unique: true|
| encrypted_password    | string  | null: false              |

- has_many :shoes
- has_many :comments

# shoes テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| manufacturer_id | integer   | null: false                    |
| color_id        | integer   | null: false                    |
| inout_id        | integer   | null: false                    |
| title           | string    | null: false                    |
| explanation     | text      | null: false                    |
| user            | reference | null: false, foreign_key: true |

- belongs_to :user
- has_many :comments

# comments テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| comment         | text      | null: false                    |
| user            | reference | null: false, foreign_key: true |
| shoe            | reference | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :shoe