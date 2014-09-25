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
end

require "steps/member_registration_steps.rb"

RSpec.configure do |c|
  c.include MemberRegistrationSteps
  c.include UserProfileSteps
end
