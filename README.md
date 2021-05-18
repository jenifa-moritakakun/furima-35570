# テーブル設計

## usersテーブル

| Column                 | Type   | Options      |
| ---------------------- | ------ | ------------ |
| nickname               | text   | null: false  |
| email                  | text   | unique: true |
| password               | text   | null: false  |
| password_confirmation  | text   | null: false  |
| family_name            | text   | null: false  |
| first_name             | text   | null: false  |
| family_name_full_width | text   | null: false  |
| first_name_full_width  | text   | null: false  |
| birth_day              | date   | null: false  |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| image            | text   | null: false |
| name             | string | null: false |
| description      | text   | null: false |
| details_category | string | null: false |
| details_status   | string | null: false |
| shipping_charges | string | null: false |
| shipping_area    | string | null: false |
| shipping_days    | string | null: false |
| selling_price    | string | null: false |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| product_information   | references | foreign_key: true |
| purchase_record       | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :sipping_addresses

## shipping_addressテーブル

| Column                | Type    | Options      |
| --------------------- | ------- | ------------ |
| postal_code           | integer | null: false  |
| prefectures           | string  | null: false  |
| municipality          | string  | null: false  |
| address               | string  | null: false  |
| building_name         | string  |              |
| phone_number          | integer | unique: true |

### Association

- belongs_to :purchase

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments
