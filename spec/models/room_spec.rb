require 'rails_helper'

RSpec.describe Room, :type => :model do
  describe "parse chat messages" do
    it_behaves_like "parse chat"
  end
end
