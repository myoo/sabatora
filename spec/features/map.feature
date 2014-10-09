Feature: マップ
  セッション中に表示するマップを管理する
  部屋に登録したマップを表示する
  マップはシナリオに登録し、シナリオを部屋に登録して使用する
  マップはヘックスと方眼の二種類登録できる

Background:
  Given ユーザーがログインしている
  And ユーザーがコミュニティに所属している 

Scenario: マップを登録する
  Given マップの登録画面を表示する
  When タイトルに "テスト用マップ" を入力する
  And 説明を入力する
  And 画像を登録する
  And 方眼を選択する
  And 作成ボタンをクリックする
  Then マップが作成される
  And マップの一覧に "テスト用マップ" が表示される
  
Scenario: マップを部屋に表示する
  Given "テスト用マップ" マップが作成されている
  When "テスト用ルーム" 部屋を作成する
  And 新規シナリオを作成する
  And "テスト用マップ" をシナリオに登録する
  And "テスト用ルーム" のセッションルームにインする
  And マスターメニューでマップを選択する
  And マップの表示ボタンをクリックする
  Then マップに登録した画像が表示される

Scenario: マップ上にキャラクターアイコンを表示する
  Given セッションルームにインしている
  And マップが登録されている
  When マップを表示する
  Then キャラクターアイコンが表示される
  And キャラクターアイコンをドラッグして移動できる
  And キャラクターアイコンはマス目に沿って配置される

Scenario: マップはキャラクターアイコンの位置を記録する
  Given マップ上のキャラクターアイコンを移動している
  And マップを閉じる
  When マップを開く
  Then キャラクターアイコンが移動後の位置に存在している

  
