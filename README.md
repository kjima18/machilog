# まちの情報共有アプリ　『まちログ』
旅好き、まち歩き好きのための情報共有アプリです。

- 自分が訪れたまちの情報を発信できる！
- 地域名から投稿を検索し、気になるまちの情報を集められる！

本番環境：
https://machilog.herokuapp.com/

## 機能一覧

- ユーザー登録機能
- ユーザーログイン・ログアウト機能
- 記事投稿機能（どのまちに関する情報か選択可能(Ajaxで実装)）
- 投稿の編集機能
- 投稿へのコメント機能
- 投稿へのいいね機能(Ajaxで実装)
- 投稿の検索機能（ransack）
- 記事のページネーション機能（kaminari）

## 使用技術一覧

- Ruby 2.6.3
- Ruby on Rails 5.2.0
- mysql2
- Bootstrap4
- Heroku(https化)
- いいね機能はAjax(jQuery)で実装
- 都道府県、市町村選択機能はAjax(coffee script)で実装
- 写真を投稿する際はAmazon Web ServiceのS3にアップロード
- 検索にはransackを使用



