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

  step "プロフィールを :action する" do |action|
    case  action
    when "登録"
      class_text = ".new_profile"
    when "編集"
      class_text = ".edit_profile"
    end
    within class_text do
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

  step ":name というユーザーがプロフィール登録されている" do |name|
    @password = "password"
    @profiled_user = FactoryGirl.create(:user, name: name, password: @password, password_confirmation: @password, confirmed_at: Time.now)
    @profile = FactoryGirl.create(:profile, user: @profiled_user)
  end

  step ":name でログインしている" do |name|
    user = User.find_by(name: name)
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: @password
    click_button "ログイン"
    expect(page).to have_content("ログインしました")
  end

  step "プロフィール登録画面にアクセスする" do
    visit new_profile_path
  end

  step "トップページにリダイレクトされる" do
    expect(page).to have_css("h1", text: "Sabatora")
  end

  step "エラーメッセージが表示される" do
    expect(page).to have_content("既にプロフィールが登録されています")
  end

  step "プロフィール編集画面を表示する" do
    find(:xpath, '//a[@title="My page"]').click
    click_link "プロフィール変更"
    expect(page).to have_css("h1", text: "プロフィール編集")
  end

  step "プロフィールを編集する" do
    send "プロフィールを入力する"
  end

  step "更新ボタンを押す" do
    click_button "更新する"
  end

end

require "steps/member_registration_steps.rb"

RSpec.configure do |c|
  c.include MemberRegistrationSteps
  c.include UserProfileSteps
end
