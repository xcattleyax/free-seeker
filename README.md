# アプリケーション名
free-seeker

# アプリケーションの概要 
ユーザー同士でコミュニケーションを取ること、また投稿機能を持っている。

# URL
https://free-seeker.herokuapp.com/

# テスト用アカウント
email: gest@gmail.com  
password: 123456

# 利用方法
### チャット機能
1.トップページからユーザー新規登録を行う。  
2.グループを選択し、チャット画面に遷移する。  
3.画面下部のチャットフォームよりコメントを投稿する  
### 投稿機能
1.トップページからユーザー新規登録を行う。  
2.新規投稿よりタイトル入力画面に遷移、タイトルを保存する。  
3.ページタイトル、内容を書いていき、公開を行う。

# アプリケーションを作成した背景 
元々ラインで作成していたグループ用のアプリケーション。新しくグループ機能を実装し、グループチャットを可能とした。また、各種投稿なども保存期間等を無くすため、投稿機能を実装。

# 洗い出した用件
https://docs.google.com/spreadsheets/d/19daczIuNrADmIKwMs0c17JsWxMc2Jhs4_58LPiDKaIw/edit#gid=982722306

# 実装した機能についての画像と説明
### トップページ
[![Image from Gyazo](https://i.gyazo.com/2bd8cdf4ad2d4a0eefbbaff8a31d8550.png)](https://gyazo.com/2bd8cdf4ad2d4a0eefbbaff8a31d8550)
トップページです。こちらから様々な機能にアクセスできます。初期状態として、投稿更新情報が表示されるようになっています。

# 実装予定の機能
いいね機能などを考えている

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/827de124ee57ae490517f4ae50abed5f.png)](https://gyazo.com/827de124ee57ae490517f4ae50abed5f)

# 画像遷移図
[![Image from Gyazo](https://i.gyazo.com/d27ec03cf2bfa94fe1fa74e4e55e2e3d.png)](https://gyazo.com/d27ec03cf2bfa94fe1fa74e4e55e2e3d)

# 開発環境
・フロントエンド : HTML,CSS,JavaScript  
・バックエンド : Ruby(ver.6.0.0) / Ruby on Rails(ver)  
・インフラ : AWS (EC2)  
・テスト : RSpec  
・テキストエディタ : Visual Studio Code  
・タスク管理 : GitHubプロジェクトボード  

# ローカルでの動作方法
以下のコマンドを順に実行してください。  
% git clone https://github.com/free-seeker  
% cd free-seeker  
% bundle install  
% yarn install  

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
| content            | string | null: false               |

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
| status_id   | integer    | null: false                                 |
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
| user        | references | null: false, foreign_key: true |

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
