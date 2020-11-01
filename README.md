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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| birthday | string | null: false |

### Association

- has_many :records
- has_many :products

## records テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchased_time | datetime   | null: false                    |
| user           | references | null: false, foreign_key: true |
| product        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :delivery
- belongs_to: product

## products テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | string     | null: false                    |
| image         | string     | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| price         | string     | null: false                    |
| delivery_cost | string     | null: false                    |
| shipping_area | string     | null: false                    |
| how_many_days | string     | null: false                    |
| record        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## deliverys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     |                                |
| prefecture    | string     |                                |
| city          | string     |                                |
| banchi        | string     |                                |
| building_name | string     |                                |
| tel           | string     |                                |
| record        | references | null: false, foreign_key: true |

### Association

- belongs_to :record