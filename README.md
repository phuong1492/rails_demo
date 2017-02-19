# Capistranoを紹介
## Capistranoとは？
Wikiから
Capistranoは、複数のサーバー上でスクリプトを実行するためのオープンソースのツールであり、その主な用途は、ウェブアプリケーションのソフトウェアデプロイメントである。1つ以上のWebサーバ上のアプリケーションを新しいバージョンにする作業を自動化でき、データベースを変更するといった作業もできる。

https://ja.wikipedia.org/wiki/Capistrano

## インストール
Capistranoはrubyで書かれているので，インストールするにはRubyとRubygemsとBundlerが必要である。
Gemfileという名前のファイルを作成し，以下の記述を追加して bundle install を実行することでインストールすることが出来る。

gem 'capistrano', '~> 3.0.1'

Ngoài ra, khi muốn sử dụng plugin để deploy thì cũng thêm vào Gèmile

vi dụ như thêm plugin bundle

gem 'capistrano-bundler', '~> 1.2'

## Capistranoの設定ファイルを作成する

bundle exec cap install

```
├── Capfile
├── config
│   ├── deploy
│   │   ├── production.rb
│   │   └── staging.rb
│   └── deploy.rb
└── lib
    └── capistrano
            └── tasks
```

実行すると，Capfile，configディレクトリ，libディレクトリが作成される。

## config/deploy/ステージ名.rbを記述する方法

ステージ名.rbには、ステージ毎の設定を書くことが出来る。ステージ名.rbには以下のような内容を記述する。

ホスト名
  - ログインユーザ
  - サーバロール
  - SSH設定
  - その他、そのサーバに紐づく任意の設定
　
ファイル内では，次のような対応でルールを記述する。

  - server ホスト名
  - user: ログインユーザ名
  - roles: %{サーバロール}
  - その他の設定: 値

##  config/deploy.rbを記述する方法

config/deploy.rbにはステージ間で共通の設定を記述する。よくあるのは以下のような設定である。

  - アプリケーション名
  - レポジトリ名
  - 利用するSCM
  - タスク
  - それぞれのタスクで実行するコマンド

## capコマンドでタスクを実行する  　

bundle exec cap test deploy

P/S
Deploy RollBack

bundle exec cap test deploy:rollback
