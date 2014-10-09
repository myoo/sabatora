# -*- coding: utf-8 -*-
require 'rails_helper'

module MapSteps
  step "マップの登録画面を表示する" do
    visit new_community_map_path(@community)
    expect(page).to have_css('h1', "マップの新規登録")
  end
end

RSpec.configure { |c| c.include MapSteps }
