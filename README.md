# README

## 環境構築
```
$ bundle install --without=production
$ bin/rails db:setup
$ yarn install
$ bin/webpack
$ bin/rails s
```

## 事業をエンジニアリングしよう提案編の回答は以下に記述してください

### <選択した事業側の課題>
#### サービス登録者数の内、男性60%に対して、女性は40%。一方で、サービス内のもくもく会に参加した人の比率は、男性90%：女性10%と大きな差が出ています。 
#### もっと女性が使いやすいようなサービス設計にする必要があるのではないか？

### <提案内容>
#### 各自のプロフィールに「自己紹介」の項目を追加することで、参加者が互いに理解しやすい状況を作る。 
#### → 男性は一般的に競争志向が強く、自己紹介が少ない状況でも問題なく行動する傾向がある。 
#### (自分自身の力を試すためにもくもく会に参加することが多い) 　　　
#### 一方で、女性はコミュニティや共感を重視する傾向があり、相手の情報を事前に知ることで、
#### 安心感が生まれ積極的に参加するきっかけになる。 
#### (コミュニティを重視し、共感を求め、もくもく会に参加することが多い）

### <実装方法>
#### ・「自己紹介」項目の追加 　　ユーザープロフィールの編集画面に新たなフィールドを追加

#### ・表示文字数の制限

#### ・フィールドに入力された内容のデータベースへの保存
