# -*- coding: utf-8 -*-
require 'rails_helper'

module MapSteps
  step "マップの登録画面を表示する" do
    visit new_community_map_path(@community)
    expect(page).to have_css('h1', "マップの新規登録")
  end

  step "タイトルに :mapname を入力する" do |mapname|
    fill_in "タイトル", with: mapname
  end

  step "説明を入力する" do
    fill_in "説明", with: "説明文"
  end

  step "画像を登録する" do
    attach_file '画像', "#{Rails.root}/spec/support/testfiles/map.jpg"
  end

  step "登録ボタンをクリックする" do
    click_button "登録する"
  end

  step "マップが作成される" do
    expect(page).to have_content("マップを作成しました")
  end

  step "マップの一覧に :mapname が表示される" do |mapname|
    visit community_maps_url(@community)
    expect(page).to have_content(mapname)
  end
end

RSpec.configure { |c| c.include MapSteps }
