# VINFASH
 
# Description

The purpose of this app is making friends who likes vintage clothing and postting your favarite one.

このWEBアプリケーションは古着好きの友達作り、投稿の閲覧を目的として作られました。

# DEMO
* notification
 
<img width="1114" alt="スクリーンショット 2019-12-03 23 23 13" src="https://user-images.githubusercontent.com/50481755/70173702-badd3500-1716-11ea-9c5a-383bf7408ac7.png">

 
* user page
 
 <img width="1181" alt="スクリーンショット 2019-12-03 23 23 28" src="https://user-images.githubusercontent.com/50481755/70174114-a77e9980-1717-11ea-8360-db41e6561060.png">
 
 
* chat
 
 <img width="803" alt="スクリーンショット 2019-12-03 23 24 00" src="https://user-images.githubusercontent.com/50481755/70174287-ec0a3500-1717-11ea-92ad-6bb3e1e8e0f8.png">

 
# Features
 
* Create an accaunt.
* Following other users
* Chating with other users.
* Posting photos.
* Sending  comments to other's post
* Announcing your any events which will take place before long.
 
* This app has notification. if you receive that, it shows someone follows you, texts you, or makes comments on your posts.
 
記事関連
    * 投稿機能
    * 一覧表示機能
    * 詳細表示機能
    * 削除機能
    * 編集機能
    * プレビュー機能
    
ユーザー関連
    * 登録機能
    * よく行く買い物エリアの登録機能
    * 編集機能(アドレス・パスワード)
    * 管理ユーザー追加機能
    * ログイン・アウト機能

チャット機能
    * チャット機能
    * 最新チャット一覧

コメント関連
    * コメント投稿機能
    * 削除機能
    
友達関連
    * フォロー機能
    * チャット機能

通知機能
    * フォロー通知機能
    * メッセージ通知機能
    * 投稿に対するコメント通知機能
    
お問い合わせ機能
    * お問い合わせを送信機能


# Requirement
    
     * ruby 2.6.3
     * Rails 5.0.7.2
     * html5
     * css 
     * javascript

Library(gem)
    
    * sqlite3  1.3.13
    * puma
    * jquery-rails
    * bootstrap
    * carrierwave
    * devise
    * seed_fu 2.3
    * font-awesome-rails
    * data-confirm-moda
    * kaminari ページネーション 0.17.0

# Setup
 
arrierwave

    * $ bundle install
    * $ rails g migration add_image_to_articles カラム名:string
    * $ rails db:migrate
    * $ rails g uploader Image
    * mount_uploader :image, ImageUploader

devise

    * $ rails g devise:install
    * $ rails g devise user
    * $ rails db:migrate
    * $ rails g devise：controllers users
    * $ rails g devise:views

Bootstrap

    * $ rails g bootstrap:install



# Usage

you can post something without photo.

Two users follow each other, then they can chat.

 
# License

This software is released under the MIT License, see LICENSE.

# Note
 
Everyone can see user's posts, but if you would like to enjoy anything else, you have to sign up or logn in.

投稿、イベントの閲覧はできますが、他の機能を使う場合はSing Upまたは、Logn inが必要となります。


# simple accaunt

* mail -> simple@gmail.com

* password -> simple0114

* you can use that one  (テスト用にお使いください。)



# Author
 
* Koki Miura　　
* Toyo univercity

* 三浦 光樹　　
* 東洋大学

