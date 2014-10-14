Feature: 背景管理
  Background:
    Given ユーザーが登録されている
    And コミュニティが存在している
    And コミュニティに登録している
    And 一つ以上コミュニティにセッションルームが作成されている
 
  Scenario: 背景をPUBLICで登録する
    Given ユーザーがログインしている
    And コミュニティトップを表示している
    When 「背景管理」ボタンをクリックする
    And 「新しく背景を登録する」ボタンをクリックする
    And Roomセレクタで一番上の部屋を選択する
    And 名前フォームに "テスト" と入力する
    And 「選択」ボタンを押し、適当な画像ファイルを選択する
    And 説明フォームに "テスト用" と入力する
    And 公開範囲を「PUBLICk」で設定する
    And 「登録する」ボタンをクリックする
    Then Background was successfully created.と上部に表示される
    And ルーム名が表示される
    And 名前が表示される
    And 説明が表示される
    And 投稿した画像が表示される
    And 投稿したユーザー名が表示される
    And コミュニティ名が表示される
    And アクセス数が表示される
    And 画像が登録される

  Scenario: 背景の名前を変更する
    Given ユーザーがログインしている
    And 背景が一つ以上登録されている
    And 背景画像一覧が表示されている
    When 背景画像一覧の一番目にある画像の「編集」ボタンをクリックする
    And 名前フォームに "名前変更テスト" と入力する
    And 「更新する」ボタンをクリックする
    Then 確認ページが表示される
    And Background was successfully updated.と上部に表示される
    And 変更した名前が表示される
    And ルーム名が表示される
    And 説明が表示される
    And 投稿した画像が表示される
    And 投稿したユーザー名が表示される
    And コミュニティ名が表示される
    And アクセス数が表示される
    And 画像が登録される

  Scenario: 背景を削除する
    Given ユーザーがログインしている
    And 背景が一つ以上登録されている
    And 背景画像一覧が表示されている
    When 背景画像一覧の一番目にある画像の「削除」ボタンをクリックする
    And 「OK」ボタンをクリックする
    Then 指定した画像が消去された背景画像一覧ページが表示される
    And Background was successfully destroyed.と上部に表示される
    And 画像が削除される
