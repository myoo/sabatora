# -*- coding: utf-8 -*-
require 'rails_helper'

describe System::CthuluSystem do
  it "should work" do
    described_class.new(title: 1)
  end

  it "キャラクターのパラメータを作成できること" do
    system = described_class.new(title: 1)
    paramaters = system.new_character_params
    expect(paramaters).to include(:STR, :CON, :SIZ, :DEX, :APP, :SAN, :INT, :POW, :EDU, :IDEA, :LUCK, :KNOW, :MAX_SAN, :DB, :HP, :MP)
    expect(paramaters[:STR]).to be_between(3, 18).inclusive
    expect(paramaters[:CON]).to be_between(3, 18).inclusive
    expect(paramaters[:DEX]).to be_between(3, 18).inclusive
    expect(paramaters[:APP]).to be_between(3, 18).inclusive
    expect(paramaters[:POW]).to be_between(3, 18).inclusive
    expect(paramaters[:EDU]).to be_between(6, 21).inclusive
    expect(paramaters[:SIZ]).to be_between(8, 18).inclusive
    expect(paramaters[:INT]).to be_between(8, 18).inclusive

    expect(paramaters[:SAN]).to satisfy{ |val| val = paramaters[:POW]*5 }
    expect(paramaters[:IDEA]).to satisfy{ |val| val =  paramaters[:INT]*5 }
    expect(paramaters[:KNOW]).to satisfy{  |val| val = paramaters[:EDU]*5 }
    expect(paramaters[:LUCK]).to satisfy{ |val| val =  paramaters[:POW]*5 }
    expect(paramaters[:HP]).to satisfy{ |val| val =  ((paramaters[:CON]+paramaters[:SIZ])/2).ceil }
  end
end
