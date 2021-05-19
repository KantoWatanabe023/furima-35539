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

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name        | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| last_name   | string | null: false |
| first_name  | string | null: false |
| birth_day   | date   | null: false |


### Association
- has_many :items
- has_many :buys

## items テーブル
| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| items_name  | string  | null: false |
| items_about | text    | null: false |
| category    | string  | null: false |
| status      | string  | null: false |
| shipping    | string  | null: false |
| place       | string  | null: false |
| day         | string  | null: false |
| price       | integer | null: false |



### Association
- belongs_to :user
- has_one :buy

## buys テーブル

| Column     | Type     | Options     |
| ------     | -------- | ----------- |
| credit_num | integer  | null: false |
| deadline   | integer  | null: false |
| security   | integer  | null: false |
| post_num   | integer  | null: false |
| metropolis | string   | null: false |
| city       | string   | null: false |
| address    | integer  | null: false |
| building   | string   | null: false |
| phone_num  | integer  | null: false |


### Association
- belongs_to :item
- belongs_to :user