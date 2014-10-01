# -*- coding: utf-8 -*-
require 'rails_helper'
module JoiningCommunitySteps
  include Warden::Test::Helpers

  step "ユーザーが登録されている" do
    @user = FactoryGirl.create(:user, confirmed_at: Time.now)
  end

  step "ユーザーがログインする" do
    login_as @user
  end

  step ":name コミュニティが存在する" do |name|
    @community = FactoryGirl.create(:community, name: name)
  end

  step ":name コミュニティのコミュニティページを開く" do |name|
    visit community_path(@community)
    expect(page).to have_content(name)
  end

  step "コミュニティに参加する" do
    find_link( "このコミュニティに参加する").click
    expect(page).to have_content(@community.description)
    within "#new_joining" do
      fill_in "コメント", with: "コメント入力"
      click_button "参加を申込む"
    end
    expect(page).to have_content("#{@community.name}に参加を申し込みました！")
  end

  step "メンバー一覧にユーザー名が表示される" do
    within ".users-list-group" do
      click_link "全て見る"
    end
    expect(page).to have_content(@user.name)
  end

  step "メンバー一覧にコメントが表示される" do
    expect(page).to have_content("コメント入力")
  end

  step "権限が一般ユーザーである" do
    expect(page).to have_xpath("//tr[td[contains(., '#{@user.name}')]]/td", :text => 'member')
  end

  step "ユーザーがコミュニティに参加している" do
    FactoryGirl.create(:joining, user: @user, community: @community)
  end

  step "管理者でログインしている" do
    @admin = FactoryGirl.create(:user)
    FactoryGirl.create(:admin, user: @admin, community: @community)

    login_as @admin
  end

  step "ユーザーを管理者に設定する" do
    visit community_path(@community)
    within ".users-list-group" do
      click_link "全て見る"
    end
    find(:xpath, "//tr[td[contains(., '#{@user.name}')]]/td/a[text() = '変　更']").click
    select('administrator', from: 'joining[role_id]', match: :first)
    click_button '保存する'
    expect(page).to have_content("メンバーを変更しました")
  end

  step "ユーザーの権限が管理者ユーザーになる" do
    visit community_joinings_path(@community)
    expect(page).to have_xpath("//tr[td[contains(., '#{@user.name}')]]/td", :text => 'administrator')
  end

  step "コミュニティの設定ページを表示できる" do
    visit community_path(@community)
    find_link("コミュニティの編集").click
    expect(page).to have_css("h1", "コミュニティの編集")
  end

  step "コミュニティ参加の一般ユーザーでログインしている" do
    @another_user = FactoryGirl.create(:user, created_at: Time.now)
    FactoryGirl.create(:joining, user: @another_user, community: @community)
    login_as @another_user
  end

  step "ユーザー一覧を表示する" do
    visit community_joinings_path(@community)
    expect(page).to have_css("h1", "【#{@community.name}】メンバーリスト")
  end

  step "ユーザーの編集ボタンが表示されていない" do
    expect(page).not_to have_xpath("//tr[td[contains(., '#{@user.name}')]]/td/a[text() = '変　更']")
  end

  step "変更を選択する" do
    find(:xpath, "//tr[td[contains(., '#{@user.name}')]]/td/a[text() = '変　更']").click
  end

  step "権限の変更ボックスは表示されない" do
    expect(page).not_to have_css("select")
  end

  step "コメントを編集する" do
    fill_in "コメント", with: "変更したコメント"
    click_button "保存する"
  end

  step "ユーザー一覧のコメントが変更される" do
    within ".users-list-group" do
      click_link "全て見る"
    end
    expect(page).to have_content("変更したコメント")
  end

end

RSpec.configure { |c| c.include JoiningCommunitySteps }
