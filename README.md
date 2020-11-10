# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| lastname           | string | null: false |
| firstname          | string | null: false |
| furigana_lastname  | string | null: false |
| furigana_firstname | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :records
- has_many :products

## records テーブル 購入記録
## 「新規登録（ログイン）をしたユーザーは、いくつ商品を購入することができる

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| product        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :delivery
- belongs_to: product

## products テーブル 商品情報

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| price            | integer    | null: false                    |
| delivery_cost_id | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| how_many_days_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

* カラムをcategory_idにする理由は、カテゴリのidをproductsテーブルに保存するためです。
そうすることで、idに紐付いているジャンルの情報を取得できます。

### Association

- belongs_to :user
- has_one :record

## deliverys テーブル 購入記録と住所（発送先）

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| banchi         | string     | null: false                    |
| building_name  | string     |                                |
| tel            | string     | null: false                    |
| record         | references | null: false, foreign_key: true |

### Association

- belongs_to :record