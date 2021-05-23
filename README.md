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

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------              |
| nickname                  | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_detail      | string | null: false               |
| first_name_detail     | string | null: false               |
| birth_day             | date   | null: false               |


### Association
- has_many :items
- has_many :buys

## items テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| items_name  | string     | null: false       |
| items_about | text       | null: false       |
| category_id | integer    | null: false       |
| status_id   | integer    | null: false       |
| shipping_id | integer    | null: false       |
| place_id    | integer    | null: false       |
| day_id      | integer    | null: false       |
| price       | integer    | null: false       |
| user        | references | foreign_key: true |



### Association
- belongs_to :user
- has_one :buy

## buys テーブル
| Column | Type       | Options           |
| ----   | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :residence



## residences テーブル
| Column     | Type       | Options           |
| ------     | ---------- | ----------------- |
| post_num   | string     | null: false       |
| place_id   | integer    | null: false       |
| city       | string     | null: false       |
| address    | string     | null: false       |
| building   | string     |                   |
| phone_num  | string     | null: false       |
| buy        | references | foreign_key: true |


### Association
- belongs_to :buy

