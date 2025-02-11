# Redmine開発環境

Redmineのプラグイン開発環境を Docker Compose を使って構築するためのリポジトリです。

## 環境構成

- Redmine 4.2.10
- MySQL 8.0
- Docker Compose

## Redmineのセットアップ方法

データ永続化するためにコンテナにマウントするフォルダを作成
```bash
mkdir -p redmine/files
mkdir -p redmine/themes
mkdir -p mysql
```

Docker Composeを使ってRedmine、MySQLを起動
```bash
docker-compose up -d
```

Devcontainerでコンテナに接続


## プラグイン開発
参考：https://www.redmine.org/projects/redmine/wiki/Plugin_Tutorial

サンプルで作成したPollsプラグインをインストールする方法

プラグインのデータベースマイグレーション
```bash
bundle exec rake redmine:plugins:migrate
```

表示させるデータを登録

```bash
bundle exec rails console
>> Poll.create(question: "Can you see this poll")
>> Poll.create(question: "And can you see this other poll")
>> exit
```

プラグインのテスト
```bash
RAILS_ENV=test bundle exec rake test TEST=plugins/polls/test/functional/polls_controller_test.rb
```



