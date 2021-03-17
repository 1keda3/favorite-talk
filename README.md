# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :rooms
- has_many :messages

## rooms テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| name        | string     | null: false       |
| room_tag_id | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :tags, through: room_tags
- has_many :room_tags
- has_many :messages

## room_tags テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| tag_id    | references | null: false, foreign_key: true |
| room_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :tags

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |
| room_id | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## tags テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| tag_name | string     | null: false |

### Association

- has_many :rooms, through: room_tags
- has_many :room_tags
