# テーブル設計

## usersテーブル

| Column                 | Type   | Options                    |
| ---------------------- | ------ | -------------------------- |
| nickname               | string | null: false                |
| email                  | string | nill: false, unique: false |
| encrypted_password     | string | null: false                |
| family_name            | string | null: false                |
| first_name             | string | null: false                |
| family_name_full_width | string | null: false                |
| first_name_full_width  | string | null: false                |
| birth_day              | date   | null: false                |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| name                | string     | null: false       |
| description         | text       | null: false       |
| details_category_id | integer    | null: false       |
| details_status_id   | integer    | null: false       |
| shipping_charges_id | integer    | null: false       |
| shipping_area_id    | integer    | null: false       |
| shipping_days_id    | integer    | null: false       |
| selling_price       | integer    | null: false       |
| user                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| shipping_area_id | integer    | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| order            | references | foreign_key: true |

### Association

- belongs_to :order
