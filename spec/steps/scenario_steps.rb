# -*- coding: utf-8 -*-
module ScenarioSteps
  step ":name の設定画面を表示する" do |name|
    visit community_rooms_path(@community)
    click_link name
    expect(page).to have_css("h1", name)
    find_link("ルームの編集").click
    expect(page).to have_css("h1", "セッションルームの編集")
  end
end

RSpec.configure { |c| c.include ScenarioSteps }
