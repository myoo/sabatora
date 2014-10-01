# -*- coding: utf-8 -*-
require 'rails_helper'
module JoiningCommunitySteps
  include Warden::Test::Helpers

  step "ユーザーがログインしている" do
    @user = FactoryGirl.create(:user, confirmed_at: Time.now)
    login_as @user
  end

  step ":name コミュニティのコミュニティページを開く" do |name|
    @community = FactoryGirl.create(:community, name: name)
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
    expect(page).to have_xpath("//tr[td[contains(.,@user.name)]]/td", :text => 'member')
  end
end

RSpec.configure { |c| c.include JoiningCommunitySteps }
