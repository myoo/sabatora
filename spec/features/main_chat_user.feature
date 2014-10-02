Feature: メインチャット(ユーザー)

  Background: セッションに参加できる
  	Given 会員登録する
  	And ログインする
    And コミュニティに参加する
    And セッションにプレイヤーとして参加する

  Scenario: コメントをする（エンターキー）
    Given セッションルームページを表示している
    When コメントフィールドに "こんにちわ" と入力する
    And エンターキーを押す
    Then メインチャット表示スペースにユーザー名が表示される
    And "こんにちわ" と表示される

  Scenario: コメントをする（送信ボタン）
    Given セッションルームにて５００件以上コメントがされている
    When コメントフィールドに "こんにちわ" と入力する
    And 送信ボタンをクリックする
    Then ３秒以内にメインチャット表示スペースにユーザー名が表示される
    And ３秒以内に"こんにちわ" と表示される

  Scenario:　チャットが参照できる
    Given セッションルームにて５００件以上コメントがされている
    And セッションルームトップが表示されている
    When セッションルームに行くボタンをクリック
    Then ３秒以内にメインチャット表示スペースに最新５００件のコメントログが表示される

  Scenario: キャラクターとしてコメントをする（エンターキー）
    Given キャラクターを登録している
    And セッションルームページを表示している
    When キャラクターで発言用チェックボックスにチェックをいれる
    And コメントフィールドに "こんにちわ" と入力する
    And エンターキーを押す
    Then ３秒以内にメインチャット表示スペースにキャラクター名が表示される
    And ３秒以内にキャラクター名の後ろに" （ユーザー名） "と表示される
    And ３秒以内に "こんにちわ" と表示される

  Scenario: キャラクターとしてコメントをする（送信ボタン）
    Given キャラクターを登録している
    And セッションルームページを表示している
    When キャラクターで発言用チェックボックスにチェックをいれる
    And コメントフィールドに "こんにちわ" と入力する
    And 送信ボタンをクリックする
    Then ３秒以内にメインチャット表示スペースにキャラクター名が表示される
    And ３秒以内にキャラクター名の後ろに" （ユーザー名） "と表示される
    And ３秒以内に "こんにちわ" と表示される

  Scenario: コメントに色をつける（エンターキー）
    Given セッションルームページを表示している
    When コメントフィールドに "こんにちわ" と入力する
    And カラーピッカーで#ff0000を選択する
    And エンターキーを押す
    Then ３秒以内にメインチャット表示スペースにユーザー名が#ff0000で表示される
    And ３秒以内に "こんにちわ" というコメントが#ff0000で表示される

  Scenario: コメントに色をつける（送信ボタン）
    Given セッションルームページを表示している
    When コメントフィールドに "こんにちわ" と入力する
    And カラーピッカーで#ff0000を選択する
    And 送信ボタンをクリックする
    Then ３秒以内にメインチャット表示スペースにユーザー名が#ff0000で表示される
    And ３秒以内に "こんにちわ" というコメントが#ff0000で表示される

  Scenario: キャラクターとして立ち絵を変更しコメントをする（送信ボタン）
    Given キャラクターを登録している
    And キャラクターの立ち絵を２パターン登録している
    And セッションルームページを表示している
    When キャラクターで発言用チェックボックスにチェックをいれる
    And コメントフィールドに "こんにちわ" と入力する
    And 立ち絵セレクタで二番目の立ち絵パターンを選択する
    And 送信ボタンをクリックする
    Then ３秒以内にメインチャット表示スペースにキャラクター名が表示される
    And ３秒以内にキャラクター名の後ろに "（ユーザー名）" と表示される
    And 選択した立ち絵が表示される
    And ３秒以内に "こんにちわ" と表示される

  Scenario: キャラクターとして立ち絵を変更しコメントをする（エンターキー）
    Given キャラクターを登録している
    And キャラクターの立ち絵を２パターン登録している
    And セッションルームページを表示している
    When キャラクターで発言用チェックボックスにチェックをいれる
    And コメントフィールドに "こんにちわ" と入力する
    And 立ち絵セレクタで二番目の立ち絵パターンを選択する
    And エンターキーを押す
    Then ３秒以内にメインチャット表示スペースにキャラクター名が表示される
    And ３秒以内にキャラクター名の後ろに "（ユーザー名）" と表示される
    And 選択した立ち絵が表示される
    And ３秒以内に "こんにちわ" と表示される

  Scenario: キャラクターのステータスを変更する
    Given キャラクターを登録している
    And セッションルームページを表示している
    When 左メニューのマイステータスをクリックする
    And HPのフィールドにある値を１減らす
    And 保存ボタンを押す
    Then マイステータスのHPが１減らされている

  Scenario: 他キャラクターのステータスを確認する
    Given キャラクターを登録している
    And キャラクターを登録している参加者が自分以外にもいる
    And セッションルームページを表示している
    When 左メニューのメンバーズをクリックする
    Then メインスペース上部に、メンバーステータスウィンドウが表示される