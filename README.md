# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :group_users
- has_many :groups, through: :group_users
- has_many :messages
- has_many :post, as: :contributors

## groups テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |

### Association

- has_many :group_users
- has_many :users, through: :group_users
- has_many :messages
- has_many :post, as: :contributors
- has_many :schedule

## group_users テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| group      | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group

## schedules テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| date     | date       | null: false                    |
| content  | string     | null: false                    |
| text     | text       | null: false                    |
| group    | references | null: false, foreign_key: true |

### Association

- belongs_to :group


## messages テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| message  | string     | null: false                    |
| group    | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group

## posts テーブル

| Column      | Type       | Options                                     |
| ----------- | ---------- | ------------------------------------------- |
| title       | string     | null: false                                 |
| contributor | references | null: false, polymorphic: true, index: true |

### Association

- belongs_to :contributor, polymorphic: true
- has_many :pages
- has_many :comments
- has_many :answers

## pages テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | string     | null: false                    |
| text        | text       | null: false                    |
| post        | references | null: false, foreign_key: true |

### Association

- belongs_to :post

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| comment     | string     | null: false                    |
| post        | references | null: false, foreign_key: true |

### Association

- belongs_to :post

## answers テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| question    | string     | null: false                    |
| answer      | text       | null: false                    |
| post        | references | null: false, foreign_key: true |

### Association

- belongs_to :post
