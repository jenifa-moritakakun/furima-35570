# テーブル設計

## usersテーブル

| Column                 | Type   | Options      |
| ---------------------- | ------ | ------------ |
| nickname               | text   | null: false  |
| email                  | text   | unique: true |
| password               | text   | null: false  |
| encrypted_password     | text   | null: false  |
| family_name            | text   | null: false  |
| first_name             | text   | null: false  |
| family_name_full_width | text   | null: false  |
| first_name_full_width  | text   | null: false  |
| birth_day              | date   | null: false  |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| name                | string | null: false |
| description         | text   | null: false |
| details_category_id | string | null: false |
| details_status_id   | string | null: false |
| shipping_charges_id | string | null: false |
| shipping_area_id    | string | null: false |
| shipping_days_id    | string | null: false |
| selling_price       | string | null: false |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :sipping_address

## shipping_addressテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| shipping_area_id | string     | null: false       |
| municipality     | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | integer    | unique: true      |
| purchases        | references | foreign_key: true |

### Association

- belongs_to :purchase
