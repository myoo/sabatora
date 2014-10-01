Feature: コミュニティ参加
  Background:
    Given ユーザーが登録されている
    And "さばとら" コミュニティが存在する
  
  Scenario: ユーザーがコミュニティに参加する
    Given ユーザーがログインする
    And "さばとら" コミュニティのコミュニティページを開く
    When コミュニティに参加する
    Then メンバー一覧にユーザー名が表示される
    And メンバー一覧にコメントが表示される
    And 権限が一般ユーザーである

  Scenario: ユーザーに管理者権限を与える
    Given ユーザーがコミュニティに参加している
    And 管理者でログインしている
    When ユーザーを管理者に設定する
    And ユーザーがログインする
    Then ユーザーの権限が管理者ユーザーになる
    And コミュニティの設定ページを表示できる

  Scenario: 一般ユーザーでは権限の変更ができない
    Given ユーザーがコミュニティに参加している
    And コミュニティ参加の一般ユーザーでログインしている
    When ユーザー一覧を表示する
    Then ユーザーの編集ボタンが表示されていない

  Scenario: ユーザー自身は権限を変更できない
    Given ユーザーがコミュニティに参加している
    And ユーザーがログインする
    And  ユーザー一覧を表示する
    When 変更を選択する
    Then 権限の変更ボックスは表示されない
    
  Scenario: ユーザーはコメントの編集ができる
    Given ユーザーがコミュニティに参加している
    And ユーザーがログインする
    And  ユーザー一覧を表示する
    When 変更を選択する
    And コメントを編集する
    Then ユーザー一覧のコメントが変更される
    






    

    

    











