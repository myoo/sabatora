# -*- coding: utf-8 -*-
require 'spec_helper'

shared_examples "parse chat" do
  let(:sample) { described_class.new() }
#  let(:lines) { "あああああああああああああああああ" }

  context "sanitaize:" do
    let(:black_list) { ["だめかも", "文字列"] }
    let(:lines)  { <<EOS
だめかもしれないなこの文字列は
この行は問題ありませんよ
EOS
    }

    before do
      Obscenity.configure do |config|
        config.blacklist = black_list
        config.replacement = :stars
      end
    end

    it "指定した文字列をフィルタリングすること" do
      expect(sample.parse(lines)).to eq(["****しれないなこの***は", "この行は問題ありませんよ"])
    end
  end

  it "コマンドを解釈してメソッドリストを返すこと"

  it "URLをハイパーリンクにすること"
end
