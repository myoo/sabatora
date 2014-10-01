class WelcomeController < ApplicationController
  def index
    @newbie_communities = Community.all.order(created_at: :desc).limit(5)
  end

  def ergo_test
  end
end
