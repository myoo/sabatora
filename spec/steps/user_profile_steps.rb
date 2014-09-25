# -*- coding: utf-8 -*-
module UserProfileSteps

  step ":name （ メール： :email パスワード： :passward ）というユーザーを新規登録する" do |name, email, password|
    @new_user_name = name
    @new_user_email = email
    @new_user_password = password
    send "トップページを表示する"
    send "画面右上会員登録アイコンをクリックする"
    send ":email とメールアドレスフィールドに入力する", email
    send ":name とユーザー名フィールドに入力する", name
    send ":password とパスワードフィールドに入力する", password
    send ":password_confirmation とパスワード確認フィールドに入力する", password
    send "新規登録ボタンを押す"
    send "確認メールが送信される"
    send "確認メール内アドレスをクリックする"
  end

  step "ログインする" do
    send "ログインができるようになる"
  end

  step "プロフィール設定画面が表示される" do
    expect(page).to have_content("プロフィールを登録してください")
  end

  step "プロフィールを入力する" do
    within "#new_profile" do
      attach_file "profile[avatar]", File.expand_path("spec/support/testfiles/flower.jpg")
      choose "female"
      select "1984", from: 'profile[birth(1i)]'
      select "1月", from: 'profile[birth(2i)]'
      select "1", from: 'profile[birth(3i)]'
      fill_in "profile[introduction]", with: "テストのプロフィール"
    end
  end

  step "登録ボタンを押す" do
    click_button "登録する"
  end

  step "確認画面に内容が表示される" do
    expect(page).to have_xpath("//img[contains(@src, \"flower.jpg\")]")
    expect(page).to have_content("female")
    expect(page).to have_content("1984-01-01")
    expect(page).to have_content("テストのプロフィール")
  end

  step "実行ボタンを押す" do
    click_button "実行する"
  end

  step "プロフィール画面が表示される" do
    expect(page).to have_content("#{@name}さんのプロフィール")
  end

  step "変更内容が反映されている" do
    expect(page).to have_xpath("//img[contains(@src, \"flower.jpg\")]")
    expect(page).to have_content("female")
    expect(page).to have_content("1984-01-01")
    expect(page).to have_content("テストのプロフィール")
  end
end

require "steps/member_registration_steps.rb"

RSpec.configure do |c|
  c.include MemberRegistrationSteps
  c.include UserProfileSteps
end
