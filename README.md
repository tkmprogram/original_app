# アプリケーション名
EuroStep

# アプリケーション概要
バスケットプレイヤーのシューズ選びをサポートする

# URL
https://ginobilistep.herokuapp.com/

# テスト用アカウント
・メールアドレス：test@test.com
・パスワード：123456

# 利用方法
## シューズ投稿
1.トップページヘッダーからユーザー新規登録を行う
2.新規投稿ページに遷移しすべての項目に入力を行い投稿する
## 閲覧
・トップページに全ての投稿が表示される
・投稿画像か投稿タイトルをクリックすることで詳細ページに遷移する
・投稿者名をクリックすることでuser詳細ページに遷移できる
・検索機能を使いキーワード検索ができる
・検索機能を使い絞り込み検索ができる

# アプリケーションを作成した背景
今まで履いていたバスケットシューズを並べて一覧で見たいという思いから着想を得ました。たくさんのバスケットプレイヤーが自慢のシューズを投稿することでどのデューズを買うか迷っている人たちのサポートができると考えました。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/104dLB3s4VavYeDT6UBBNsIVyCdUW1kVYOzHz09HUH6c/edit#gid=982722306

# 実装した機能についての画像やGIF及びその説明
[![Image from Gyazo](https://i.gyazo.com/09c44eef89ac74b86fb2670c7aae9fb1.jpg)](https://gyazo.com/09c44eef89ac74b86fb2670c7aae9fb1)
[![Image from Gyazo](https://i.gyazo.com/475163383774e96d7384681c876b95d5.gif)](https://gyazo.com/475163383774e96d7384681c876b95d5)

# 実装予定の機能
今後は、コメント機能を実装予定

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/48d4b85bd557c43131baee4ddfdfdebe.png)](https://gyazo.com/48d4b85bd557c43131baee4ddfdfdebe)

#　画面遷移図
[![Image from Gyazo](https://i.gyazo.com/85284ad3c0366a851eb6c6cf40981bd3.png)](https://gyazo.com/85284ad3c0366a851eb6c6cf40981bd3)

# 開発環境
・フロントエンド
・バックエンド
・テキストエディタ
・タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行
% git clone https://github.com/tkmprogram/original_app
% cd original_app
% bundle install
% yarn install

# 工夫したポイント
ransackというgemを使ってカリキュラムでは教わらなかったアクティブハッシュを用いた絞り込み検索機能を実装しました。また、絞り込み検索だけでなくキーワード検索も併せて導入することでユーザーにとって理想のシューズを探しやすい形に仕上げました。