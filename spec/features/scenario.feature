Feature: シナリオ
  シナリオはセッションで使用するマップ、NPC、シーン、シナリオテキストを管理する
  作成したシナリオはアクセス（user, community, publlic）管理を行う
  シナリオは部屋に登録して使用する

  Background:
    Given ユーザーがログインしている
    And ユーザーがコミュニティに所属している
    And ユーザーが "テストルーム" を作成している

  Scenario: シナリオ "テストシナリオ" を登録する
    Given "テストルーム" の設定画面を表示する
    When シナリオの作成を選択する
    And シナリオ名を入力する
    And 公開範囲を "public" にする
    And 作成ボタンをクリックする
    Then シナリオが作成される
    And 部屋のシナリオが "テストシナリオ" になる
    And ユーザーの作成シナリオ一覧に "テストシナリオ" が追加される
    And コミュニティのシナリオ一覧に "テストシナリオ" が追加される
    And 全体のシナリオ一覧に "テストシナリオ" が追加される

  # Scenario: シナリオの内容を登録する
  #   Given シナリオ一覧を表示する
  #   When シナリオの作成を選択する
  #   And シナリオ名を入力する
  #   And システムを選択する
  #   And 公開範囲を "private" にする
  #   And マップを登録する
  #   And 背景を登録する
  #   And NPCを登録する
  #   And シナリオテキストを登録する
  #   And 使用する部屋を選択する
  #   Then 設定した部屋のセッションルームを表示する
  #   And 登録したマップを表示できる
  #   And 登録したNPCを使用できる
  #   And 登録したシナリオテキストを表示できる
  #   And 登録した背景を表示できる






  
  