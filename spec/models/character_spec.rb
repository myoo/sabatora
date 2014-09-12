# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe Character, :type => :model do
  describe "#current_status" do
    let(:character){ FactoryGirl.create(:character) }
    let(:room){ FactoryGirl.create(Room, id: 5) }

    context "statusが存在する場合" do
      let(:status){ FactoryGirl.create(:character_status, character: character, room_id: room.id) }

      subject{ character.current_status(room.id) }
      it { should eq status }
    end

    context "statusが存在しない場合" do
      it "あたらしくstatusが作成されること" do
        status = character.current_status(room.id)
        expect(status).to be_a(Character::Status)
      end
    end
  end
end
