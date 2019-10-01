# まちの情報共有アプリ　『まちログ』
旅好き、まち歩き好きのための情報共有アプリです。

- 自分が訪れたまちの情報を発信できる！
- 地域名から投稿を検索し、気になるまちの情報を集められる！

本番環境：
https://machilog.herokuapp.com/

## 機能一覧

- ユーザー登録機能
- ユーザーログイン・ログアウト機能
- ユーザー編集機能
- 管理ユーザーの設定（ユーザー削除機能）
- 記事投稿機能（どのまちに関する投稿か選択可能(Ajaxで実装)）
- 投稿の編集機能
- 投稿へのコメント機能
- 投稿へのいいね機能(Ajaxで実装)
- 投稿の検索機能（ransack）
- 記事のページネーション機能（kaminari）

## 使用技術一覧

- Ruby 2.6.3
- Ruby on Rails 5.2.0
- MySQL2
- PostgreSQL(本番環境)
- Bootstrap4
- Heroku(https化)
- いいね機能はAjax(jQuery)で実装
- 都道府県、市町村選択機能はAjax(coffee script)で実装
- carrierwaveで画像投稿機能を実装
- 写真を投稿する際はAmazon Web ServiceのS3にアップロード
- 検索にはransackを使用
- kaminariでページネーション機能を実装

## 追加予定の機能

- RSpec によるテストの実装
- CircleCIによる自動テスト（Github連携）
- RuboCopによるコードレビュー機能の実装
- レスポンシブデザイン化
- google maps APIの取得（投稿の位置情報との紐付け）
- ユーザーフォロー機能の実装
- ソーシャルログイン機能の実装
