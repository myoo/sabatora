require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.create(:user) }

  describe "#has_role?" do
    let(:room) { FactoryGirl.create(:room) }
    let(:role) { FactoryGirl.create(:player_role, name: "master" ) }

    before do
      Player.create(room: room, user: user, player_role: role)
    end

    subject{ user.has_room_role?(room, "master")}

    it{ should be_truthy  }

  end

  describe "is_owner?" do
    let(:room) { FactoryGirl.create(:room, owner: user) }

    subject { user.is_owner?(room) }

    it { should be_truthy }
  end
end
