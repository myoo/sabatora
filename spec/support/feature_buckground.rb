# -*- coding: utf-8 -*-
step "ユーザーがログインしている" do
  @user = FactoryGirl.create(:user, confirmed_at: Time.now)
  login_as @user
end

step "ユーザーがコミュニティに所属している" do
  @community = FactoryGirl.create(:community)
  FactoryGirl.create(:joining, community: @community, user: @user)
end

step "ユーザーが :name を作成している" do |name|
  visit new_community_room_path(@community)
  fill_in "セッションルーム名", with: name
  fill_in "ルーム説明", with: "せつめいぶん"
  click_button "登録する"
end
