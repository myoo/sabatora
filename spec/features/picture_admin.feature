Feature: 立ち絵管理
  Background:
    Given ユーザーが登録されている
    And コミュニティが存在している
    And コミュニティに登録している
 
  Scenario: 立ち絵をPUBLICで登録する
    Given ユーザーがログインしている
    And コミュニティトップを表示している
    When 「立ち絵管理」ボタンをクリックする
    And 「新しく立ち絵を登録する」ボタンをクリックする
    And 名前フォームに "テスト立ち絵" と入力する
    And 説明フォームに "テスト用" と入力する
    And 「選択」ボタンを押し、適当な画像ファイルを選択する
    And 公開範囲を「PUBLICk」で設定する
    And 「登録する」ボタンをクリックする
    Then 立ち絵一覧ページが表示される
    And Illustration was successfully created.と上部に表示される
    And 名前が表示される
    And 説明が表示される
    And 投稿した画像が表示される
    And 画像が登録される

  Scenario: 立ち絵の名前を変更する
    Given ユーザーがログインしている
    And 立ち絵が一つ以上登録されている
    And 立ち絵一覧が表示されている
    When 立ち絵一覧の一番目にある「編集」ボタンをクリックする
    And 名前フォームに "テスト立ち絵の名前変更テスト" と入力する
    And 「更新する」ボタンをクリックする
    Then 立ち絵一覧ページが表示される
    And Illustration was successfully updated.と表示される
    And 変更した名前が表示される
    And 説明が表示される
    And 投稿した画像が表示される
    And 画像が登録される

  Scenario: 立ち絵を削除する
    Given ユーザーがログインしている
    And 立ち絵が一つ以上登録されている
    And 立ち絵一覧が表示されている
    When 立ち絵一覧の一番目にある「削除」ボタンをクリックする
    And 「OK」ボタンをクリックする
    Then 指定した画像が消去された立ち絵一覧ページが表示される
    And Illustration was successfully destroyed.と表示される
    And 画像が削除される
