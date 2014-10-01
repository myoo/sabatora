Feature: メインチャット(マスター)

  Background: セッションに参加できる
  	Given 会員登録する
  	And ログインする
    And コミュニティに参加する
    And セッションにマスターとして参加する

  Scenario: コメントをする（エンターキー）
    Given セッションルームページを表示している
    When コメントフィールドに "こんにちわ" と入力する
    And エンターキーを押す
    Then メインチャット表示スペースにユーザー名が表示される
    And ユーザー名の後ろにGMと表示される
    And "こんにちわ" と表示される

  Scenario: コメントをする（送信ボタン）
    Given セッションルームページを表示している
    When コメントフィールドに "こんにちわ" と入力する
    And 送信ボタンをクリックする
    Then メインチャット表示スペースにユーザー名が表示される
    And ユーザー名の後ろにGMと表示される
    And "こんにちわ" と表示される

  Scenario: NPCキャラクターとしてコメントをする（エンターキー）
    Given NPCキャラクターを登録している
    And セッションルームページを表示している
    When キャラクターセレクターで一番上のキャラクターを選択する
    And コメントフィールドに "こんにちわ" と入力する
    And エンターキーを押す
    Then メインチャット表示スペースに選択したNPCキャラクター名が表示される
    And NPCキャラクター名の後ろにGMとNPCと表示される
    And "こんにちわ" と表示される

  Scenario: NPCキャラクターとしてコメントをする（送信ボタン）
    Given NPCキャラクターを登録している
    And セッションルームページを表示している
    When キャラクターセレクターで一番上のキャラクターを選択する
    And コメントフィールドに "こんにちわ" と入力する
    And 送信ボタンをクリックする
    Then メインチャット表示スペースに選択したNPCキャラクター名が表示される
    And NPCキャラクター名の後ろにGMとNPCと表示される
    And "こんにちわ" と表示される

  Scenario: コメントに色をつける（エンターキー）
    Given セッションルームページを表示している
    When コメントフィールドに "こんにちわ" と入力する
    And カラーピッカーで#ff0000を選択する
    And エンターキーを押す
    Then メインチャット表示スペースにユーザー名が#ff0000で表示される
    And ユーザー名の後ろにGMと#ff0000で表示される
    And "こんにちわ" というコメントが#ff0000で表示される

  Scenario: コメントに色をつける（送信ボタン）
    Given セッションルームページを表示している
    When コメントフィールドに "こんにちわ" と入力する
    And カラーピッカーで#ff0000を選択する
    And 送信ボタンをクリックする
    Then メインチャット表示スペースにユーザー名が#ff0000で表示される
    And ユーザー名の後ろにGMと#ff0000で表示される
    And "こんにちわ" というコメントが#ff0000で表示される