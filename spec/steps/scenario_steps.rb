# -*- coding: utf-8 -*-
module ScenarioSteps
  step ":name の設定画面を表示する" do |name|
    @rooms_name = name
    visit community_rooms_path(@community)
    click_link @rooms_name
    expect(page).to have_css("h1", name)
    find_link("ルームの編集").click
    expect(page).to have_css("h1", "セッションルームの編集")
  end

  step "シナリオの作成を選択する" do
    click_link "新規シナリオを作成する"
    expect(page).to have_css('h1', "新規シナリオの作成")
  end

  step "シナリオ名を入力する" do
    @name = "テストシナリオ"
    fill_in "タイトル", with: @name
  end

  step "公開範囲を :access にする" do |access|
    select access, from: "scenario[access]"
  end

  step "作成ボタンをクリックする" do
    click_button "作成する"
  end

  step "シナリオが作成される" do
    expect(page).to have_content "シナリオを作成しました"
  end

  step "部屋の設定ページにリダイレクトされる" do
    expect(page).to have_css("h1", "セッションルームの編集")
  end

  step "部屋のシナリオが :name になる" do |name|
    expect(page).to have_select("シナリオ", selected: "テストシナリオ")
  end

  step "全体のシナリオ一覧に :name が追加される" do |name|
    visit community_scenarios_url(@community)
    expect(page).to have_content(name)
  end
end

RSpec.configure { |c| c.include ScenarioSteps }
