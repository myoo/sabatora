# -*- coding: utf-8 -*-
module MemberRegistrationSteps
  
  step "トップページを表示する" do
    visit root_path
    expect(page).to have_css('h1', text: "Sabatora")
  end

  step "画面右上会員登録アイコンをクリックする" do
    find(:xpath, '//a[@title="ユーザー登録"]').click
  end

  step "会員登録ページに飛ぶ" do
    expect(page).to have_content('さばとらをはじめる')
  end

  step ":email とメールアドレスフィールドに入力する" do |email|
    @email = email
    fill_in "user[email]", with: email
  end

  step ":name とユーザー名フィールドに入力する" do |name|
    fill_in "user[name]", with: name
  end

  step ":password とパスワードフィールドに入力する" do |password|
    @password = password
    fill_in "user[password]", with: password
  end

  step ":password_confirmation とパスワード確認フィールドに入力する" do |password_confirmation|
    fill_in "user[password_confirmation]", with: password_confirmation
  end

  step "新規登録ボタンを押す" do
    click_button "新規登録"
  end

  step "確認メールが送信される" do
    expect(unread_emails_for(@email).size).to be(1)
  end

  step "確認メール内アドレスをクリックする" do
    expect(open_email(@email)).to have_body_text("アドレスの承認")
     visit_in_email "アドレスの承認"
  end

  step "会員登録が完了しましたと表示される" do
    expect(page).to have_content("会員登録が完了しました")
  end

  step "ログインができるようになる" do
    visit root_path
    find(:xpath, '//a[@title="ログイン"]').click
    fill_in "user[email]", with: @email
    fill_in "user[password]", with: @password
    click_button "ログイン"
    expect(page).to have_content("ログインしました")
  end

  step "会員登録ページが表示されている" do
    visit new_user_registration_path
    send "会員登録ページが表示される"
  end

  step "会員登録ページが表示される" do
    expect(page).to have_content("さばとらをはじめる")
  end

  step "画面上部にエラーがあることが表示される" do
    expect(page).to have_css('div.alert')
  end

  step "メールアドレスフィールド下部に「を入力してください」と表示される" do
    expect(page).to have_css('input[name="user[email]"] + .help-block', text: "を入力してください。")
  end

  step "名前フィールド下部に「を入力してください」と表示される" do
    expect(page).to have_css('input[name="user[name]"] + .help-block', text: "を入力してください。")
  end

  step "パスワードフィールド下部に「を入力してください」と表示される" do
    expect(page).to have_css('input[name="user[password]"] + .help-block', text: "を入力してください。")
  end

  step "ユーザー名フィールド下部に「ユーザー名は20文字以内で入力してください。」と表示される" do
    expect(page).to have_css('input[name="user[name]"] + .help-block', text: "は20文字以内で入力してください。")
  end

  step "パスワード確認フィールド下部に「とパスワードの入力が一致しません。」と表示される" do
    expect(page).to have_css('input[name="user[password_confirmation]"] + .help-block', text: "とパスワードの入力が一致しません。")
  end
end

RSpec.configure { |c| c.include MemberRegistrationSteps }
