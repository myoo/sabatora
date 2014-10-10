Feature: アカウント削除
  Background:
    Given ユーザーが登録されている
  
  Scenario: ユーザーがアカウントを削除する
    Given ユーザーがログインする
    And トップページを表示している
    When 画面右上のマイページメニューをクリックする
    And 表示されたドロップダウンメニューの、マイページをクリックする
    And 「アカウントを削除する」ボタンをクリックする
    And でてきたポップアップの「OK」ボタンをクリックする
    Then トップページが表示される
    And 画面上部に「アカウントを削除しました。またのご利用をお待ちしております」と表示される
    And 登録が削除される
