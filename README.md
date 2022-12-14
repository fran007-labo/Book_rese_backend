# Backend
# 1,  アプリケーションの概要
前社では福利厚生で月に2冊の本を購入でき、さらに社長自らがたくさんの本を会社に持参していました。
それらを社員が社内コミュニケーションツールを使い、「この本をいついつまでに借ります。」と報告していました。
ですが、いつの間にかチャットが膨大になってしまい、本の管理が追いつかず紛失したことも多々あります。
そこで僕自身が本の予約システムを作り、使って頂いております。

# 2, アプリケーションの機能一覧
- 前社に所属している社員なら新規登録できる。
- Googleによる認証機能
- 本を登録し、自分がいつからいつまで借りるのかを登録する。
- Dashboardページにて誰が、どの本をいつまでに借りるのかが一目でわかる。
- 個人Dashboardページにて自分が借りている本が見え、本棚に返したらボタンを押して返却処理ができる。
- ページネーション機能。

# 3,　アプリケーション内で使用している技術
- 使用言語とフレイムワーク
  - Ruby version 2.7.4
  - Ruby on Rails version 6.0.4
- データベース
  - PostgreSQL
- テスト
  - Rspec
  - Factory_bot_rails
- インフラ
  - AWS ECS(fargate)　 railsデプロイ環境
  - Docker ローカル開発環境
  - 画像保存先 -> S3
  - NGINX webサーバー
  - puma (アプリケーションサーバー)
  - AWS Amplify フロントデプロイ環境

- その他
  - Firebase auth rails
  - Carrierwave
  - Mini_magick

# 4,　成果物
https://main.d2d7pygf1vwixv.amplifyapp.com/lp

# 5,　成果物DEMO video
https://www.youtube.com/watch?v=Wbja3NbmUlM
