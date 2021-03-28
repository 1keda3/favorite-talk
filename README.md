# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   |             |

### Association

- has_many :rooms
- has_many :messages

## rooms テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| title       | string     | null: false       |

### Association

- belongs_to :user
- has_many :tags, through: room_tag_relations
- has_many :room_tags
- has_many :messages

## room_tag_relations テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| tag_id    | references | foreign_key: true |
| room_id   | references | foreign_key: true |

### Association

- belongs_to :room
- belongs_to :tag

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

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| name   | string     | null: false |

### Association

- has_many :rooms, through: room_tag_relations
- has_many :room_tag_relations


# アプリケーション名
favorite-talk

# アプリケーションの概要
チャットルームを作成し、他のユーザーとチャットを行うことができます。

# URL
https://favorite-talk.herokuapp.com/

# テスト用アカウント
email: aa@a
password: aaa111

# 利用方法
まず、画面右上の新規登録ボタンからユーザー登録を行います。
その後、左上のRoom作成ボタンから自分で新たにルームを作成するか、トップページに表示されている、他のユーザーが作った既存のルームに入ります。
画面下部にある入力フォームからメッセージまたは画像を送信できます。

# 目指した課題解決
既存のアプリでは自分の言いたいことを一方的に話すか、ユーザー名も分からない人と話すアプリが多いです。
そのため、多数の人と語り合い且つ、相手の人となりがわかるという場がありませんでした。
それを解決するために、多数の人とチャットができ、ユーザー名が表示され、その人のプロフィール欄から相手の人となりが分かるようなアプリを作りました。

# 洗い出した要件

## user管理機能
### 目的
ユーザー管理を行うため。
### ユースケース
・ログアウト状態ならヘッダーに新規登録とログインボタンが表示
・ログイン状態ならニックネームとログアウトボタンが表示
・ログアウトボタンクリックでログアウトができる
・ヘッダーのニックネームをクリックするとユーザー情報ページに遷移する
・ユーザー情報ページの編集ボタンをクリックするとユーザー情報の編集ができる

## ルーム作成機能
### 目的
話題別でチャットする場所をつくるため。
### ユースケース
・ヘッダーのRoom作成ボタンをクリックするとルーム作成ページへ遷移する
・ルーム名を入力し、作成ボタンをクリックするとルームが作成できる

## メッセージ投稿機能
### 目的
チャットを行うため。
### ユースケース
・フォームに文章を入力し、送信ボタンをクリックするとチャット画面にメッセージが表示される
・画像を選んで送信ボタンをクリックするとチャット画面に表示される

## タグ付け機能
### 目的
ひと目でルーム内容が分かるようにするため。また、ルームを探しやすくするため。

### ユースケース
・ルーム作成ページのタグフォームを入力するとタグが作成される
・TOPページのルーム名の隣にタグ名が表示される

# 実装した機能についてのGIFと説明
## チャットルームの作成
ヘッダーの「Room作成」をクリック
→タイトル、タグを入力し「作成」ボタンクリック
→作成したRoomがトップページに表示される
![099fcc2b76535217f936314dfa3dd8cd](https://user-images.githubusercontent.com/78196968/112567949-0ee8bd00-8e25-11eb-8dbc-cfd9e697f55d.gif)

## チャット機能
チャット画面に入る
→文章または画像を入力
→「送信」ボタンをクリック
→チャット画面に表示される
![f2c66cee61c386ac8a6dae5e287bd8e7](https://user-images.githubusercontent.com/78196968/112568186-69821900-8e25-11eb-9b0b-e7dc7d7a574b.gif)

## ユーザー情報
ユーザー名をクリック
→ユーザー情報が表示
自分の情報なら編集ボタンが表示される
→ボタンをクリック
→ユーザー情報の編集が可能
![e6451c3aeffa38b548d1f8bdb79f1863](https://user-images.githubusercontent.com/78196968/112568231-7868cb80-8e25-11eb-9f1c-ed94eb107c96.gif)

# 実装予定の機能
指定したタグが紐付いているルームを表示するという、タグ検索機能を実装予定です。

# データベース設計
<img width="632" alt="favoriteER" src="https://user-images.githubusercontent.com/78196968/112569515-a64f0f80-8e27-11eb-93c7-59ca628b9faf.png">

