require 'rails_helper'

module TestTemps
  class ParseDouble
    include ActiveModel::Validations
    include ChatParser
  end
end

# describe ChatParser do
#   context "when included in a class" do
#     subject(:with_parse) { TestTemps::ParseDouble.new }

#     it_behaves_like "parse chat"
#   end
# end
