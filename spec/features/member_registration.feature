Feature: 会員登録

  Scenario: あるぱかというユーザーを登録する
    Given トップページを表示する
    When 画面右上Sign upアイコンをクリックする
    And 会員登録ページに飛ぶ
    And "arupaka@test.com"とメールアドレスフィールドに入力する
    And "あるぱか"とユーザー名フィールドに入力する
    And "password"とパスワードフィールドに入力する
    And "password"とパスワード確認フィールドに入力する
    And 新規登録ボタンを押す
    And 確認メールが送信される
    And 確認メール内アドレスをクリックする
    Then 会員登録されましたと表示される
    And ログインができるようになる

  Scenario: メールアドレスを未入力で新規登録する
    Given 会員登録ページが表示されている
    When "あるぱか"とユーザー名フィールドに入力する
    And "password"とパスワードフィールドに入力する
    And "password"とパスワード確認フィールドに入力する
    And 新規登録ボタンを押す
    Then
