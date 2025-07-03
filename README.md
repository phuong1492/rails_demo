# Capistranoを紹介..
opk
sdd
đ

sdsad
## Capistranoとは？
Capistranoは、複数のサーバー上でスクリプトを実行するためのオープンソースのツールであり、その主な用途は、ウェブアプリケーションのソフトウェアデプロイメントである。1つ以上のWebサーバ上のアプリケーションを新しいバージョンにする作業を自動化でき、データベースを変更するといった作業もできる。

https://ja.wikipedia.org/wiki/Capistrano

## インストール
Capistranoはrubyで書かれているので，インストールするにはRubyとRubygemsとBundlerが必要である。
Gemfileという名前のファイルを作成し，以下の記述を追加して bundle install を実行することでインストールすることが出来る。

```gem 'capistrano', '~> 3.0.1'```

更に、プラグインを使いたい場合、Gemfileにプラグインを追加する
例えば：Bundleプラグインを追加

```gem 'capistrano-bundler', '~> 1.2'```

## Capistranoの設定ファイルを作成する

```bundle exec cap install```

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

## Capfile
Capfileは、Capistranoの実行に必要なモジュールの読み込みを定義する

## config/deploy/ステージ名.rbを記述する方法
環境ごとの設定を行います。
ステージ名.rbには、ステージ毎の設定を書くことが出来る。ステージ名.rbには以下のような内容を記述する。

  - ホスト名
  - ログインユーザ
  - サーバロール
  - SSH設定
  - その他、そのサーバに紐づく任意の設定


##  config/deploy.rbを記述する方法
(デプロイ全体の設定を行います。)
config/deploy.rbにはステージ間で共通の設定を記述する。よくあるのは以下のような設定である。

  - アプリケーション名
  - レポジトリ名
  - 利用するSCM
  - タスク
  - それぞれのタスクで実行するコマンド

## capコマンドでタスクを実行する  　

```bundle exec cap <環境> <タスク>```

例えば：
テスト環境にデプロイするコマンド

```bundle exec cap test deploy```

指定するタスクを実行するのができる

```bundle exec cap test deploy:migrate```

Deploy RollBack

```bundle exec cap test deploy:rollback```


### メリット

  - 複雑サーバで自動的にデプロイできる。
  - 誰でも簡単にデプロイできる。
  - タスクのカスタマイズがやさしい。
  - Rubyで書いてるので、読みやすく、書きやすい
  - Rolebackが簡単。

### デメリット
まだ見つけません
